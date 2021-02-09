require 'test/unit'

KEY_TAG = '###'
MESSAGE_TAG = '#message_tag#'
DATE_TAG = '#date#'

module MonkeyPatch
  String.class_eval do
    ###################################################
    #  replace css selector with keyswords
    #
    ###################################################
    def replace_key(*keywords)
      key_size = keywords.size

      if scan(KEY_TAG).size != key_size
        fail "keywords size: #{key_size} not matching tags size #{scan(KEY_TAG)}: #{keywords} not match #{self}'s #{KEY_TAG} size"
      end

      key_size.times do |it| # replace the keywords
        self.sub!(KEY_TAG, keywords[it])
      end
      self
    end

    ###################################################
    # replace bulk_uploading messages template
    #
    #   Basically put a random message to the template
    #   Tag: MESSAGE_TAG '#message_tags#'
    #
    ###################################################
    def replace_with_messages
      key_size = scan(MESSAGE_TAG).size
      messages_list = []

      key_size.times do
        message = Faker::Lorem.sentence # Get random message
        self.sub!(MESSAGE_TAG, message)
        messages_list.push(message)
      end
      messages_list # return the list of messages being replaced
    end

    ###################################################
    # replace bulk_uploading messages template
    #
    #   Replace date in the template file with date passed in
    #   Tag: DATE_TAG '#date#'
    #
    #   @data: date string to be replaced with
    #
    ###################################################
    def replace_with_date(date)
      # expect only one date
      date_size = scan(DATE_TAG).size

      date_size.times do |_iter|
        self.sub!(DATE_TAG, date.to_s)
      end
    end
  end
end

class MonkeyTest < Test::Unit::TestCase
  def test_replace
    @str = 'abc###'
    assert_equal(@str.replace_key('def'), 'abcdef')
  end
end
