def load_json(filename)
  File.open(filename, 'r') do |file|
    JSON.load(file)
  end
end

def num_valid_scenarios(file_lines)
  count = 0
  file_lines.each_with_index do |line, index|
    if /^  Scenario: .+\n$/.match(line)
      count += 1 if file_lines[index - 1] != "  @broken\n"
    end
  end
  count
end

def add_broken_at_lines(file_path, line_nums, broken_tag)
  temp_file_name     = "#{Rails.root}/#{file_path}.tmp"
  original_file_name = "#{Rails.root}/#{file_path}"
  temp_file          = File.open(temp_file_name, 'w')
  original_file      = File.open(original_file_name)
  counter            = 0
  file_lines         = File.readlines(original_file_name)

  original_file.each do |line|
    counter += 1
    if line_nums.include? counter
      if counter == 1
        broken_tag = "@broken\n"
      elsif line_nums[-1] == counter
        broken_tag = "  @broken\n"
      end
      temp_file << broken_tag unless file_lines[counter - 2] == broken_tag
    end
    temp_file << line
  end

  original_file.close
  temp_file.close

  FileUtils.mv("#{temp_file_name}", "#{original_file_name}")
end

def tag_failed_scenarios(features_json)
  features_json.each do |feature|
    feature['elements'].each do |element|
      element['steps'].each do |step|
        next unless step['result']['status'] == 'failed'
        file_path = feature['uri']
        original_file_name = "#{Rails.root}/#{file_path}"
        file_lines         = File.readlines(original_file_name)
        scenario_name      = "  Scenario: #{element['name']}\n"
        broken_tag         = "@broken\n"

        # if all scenarios are broken or the background fails, we should tag the entire feature file as @broken
        if element['keyword'] == 'Background'
          line_nums  = [1]
        elsif num_valid_scenarios(file_lines) == 1
          line_nums  = [1, file_lines.index(scenario_name) + 1]
        else
          line_nums  = [file_lines.index(scenario_name) + 1]
          broken_tag = "  @broken\n"
        end

        add_broken_at_lines(file_path, line_nums, broken_tag)

        `git commit -am '(auto-tagging) Added @broken tags to failed scenarios'`
      end
    end
  end
end

def num_scenarios(file_lines)
  count = 0
  file_lines.each_with_index do |line, _index|
    count += 1 if /^  Scenario: .+\n$/.match(line)
  end
  count
end

def remove_broken_tag(file_path, broken_tag_line_num)
  temp_file_name     = "#{Rails.root}/#{file_path}.tmp"
  original_file_name = "#{Rails.root}/#{file_path}"
  temp_file          = File.open(temp_file_name, 'w')
  original_file      = File.open(original_file_name)
  file_lines         = File.readlines(original_file_name)
  counter            = 0

  original_file.each do |line|
    counter += 1
    next if (broken_tag_line_num == counter) || (line == "@broken\n")
    temp_file << line
  end

  original_file.close
  temp_file.close

  FileUtils.mv("#{temp_file_name}", "#{original_file_name}")
end

def unbreak_passing_scenarios(features_json)
  features_json.each do |feature|
    scenario_passed = true
    feature['elements'].each do |element|
      scenario_passed = true
      element['steps'].each do |step|
        scenario_passed = false if step['result']['status'] == 'failed'
      end
      next if element['keyword'] == 'Background'
      if scenario_passed

        file_path          = feature['uri']
        original_file_name = "#{Rails.root}/#{file_path}"
        file_lines         = File.readlines(original_file_name)
        scenario_name      = "  Scenario: #{element['name']}\n"
        scenario_line_num  = file_lines.index(scenario_name) + 1

        if file_lines[scenario_line_num - 2] == "  @broken\n"
          broken_tag_line_num = scenario_line_num - 1
        else
          if num_scenarios(file_lines) == 1
            broken_tag_line_num = file_lines.index("@broken\n") + 1
          end
        end

        if broken_tag_line_num
          remove_broken_tag(file_path, broken_tag_line_num)
          `git commit -am '(unbreaking) Removing @broken tags to passing scenarios'`
        end
      else
        scenario_passed = false
      end
    end
  end
end

namespace :autotag do
  desc 'Autotag failing scenarios as @broken'
  task failing_scenarios: :environment do
    features_json = load_json('cucumber.json')
    tag_failed_scenarios(features_json)
  end

  desc 'Remove @broken tag from passing scenarios'
  task unbreak_successful_scenarios: :environment do
    features_json = load_json('cucumber_broken.json')
    unbreak_passing_scenarios(features_json)
  end
end
