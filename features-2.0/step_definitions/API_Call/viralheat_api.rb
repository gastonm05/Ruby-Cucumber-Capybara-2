class ViralheatAPI < BasePage
  attr_accessor :data_integrity

  ###############################
  #
  # class methods
  #
  ###############################
  def self.generate_methods(api_name, api, keys = [])
    define_method(api_name) do
      # Note:
      #   Later if there are special api call need to check more than status code
      #   more methods can be add below for different api_name
      make_api_call(api, keys)
    end
  end

  ###############################
  #
  # public methods
  #
  ###############################
  def initialize(platform)
    select_platform(platform)   # Select platform according to input
    generate_api_methods        # Generate all api methods based on current api yml file
    data_integrity = false
  end

  ###############################
  #
  # private methods
  #
  ###############################

  private

  def select_platform(platform)
    case platform.strip.downcase
    when 'staging', 'staging3', 'staging5'
      @host = 'staging3.viralheat.com'
    when 'production'
      @host = 'cision.viralheat.com'
    else
      fail 'Unrecoganized platform'
    end
  end

  def adjust_platform(api)
    uri = URI.parse(api)
    api.sub!(uri.host, @host) # replace old host with new one
    api
  end

  def generate_api_methods
    # Get api_name:api hash from viralheat_api.yml file under config/ directory
    input_elements.each_pair { |api_name, value|
      api_url = adjust_platform(value['api'])
      check_keys = value['response_keys'].split(',')
      ViralheatAPI.generate_methods(api_name, api_url, check_keys)
    }
  end

  def check_data_integrity(json_output, response_keys)
    # Check each key's value exist
    for keys in response_keys
      value = json_output
      keys = keys.split('/')
      for key in keys
        value = value[key.to_s.strip]
      end

      puts "#{response_keys} got value #{value}"
      return false if value.nil? || value == 0
    end

    true
  end

  def make_api_call(url, response_keys)
    url = URI.parse(url)
    res = Net::HTTP.get_response(url)

    json_output = JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
    succeed = true if json_output['status'] == 200

    succeed &&= check_data_integrity(json_output, response_keys) if data_integrity

    succeed
  end
end

# Only run the following code when this file is the main file being run
if __FILE__ == $PROGRAM_NAME
  @inst = ViralheatAPI.new(' sTaGing ')
  @inst.sentiment
end
