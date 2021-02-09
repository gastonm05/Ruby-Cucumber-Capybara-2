require 'timeout'

class Utils
  ##
  # Desc: Utility method that will throw an exception if the passed in
  #       param value is nil.
  #
  # Params:
  #   param       - The parameter object to test for nil.
  #   param_name  - The name of the parameter being tested.
  ##
  def self.throw_if_nil(param, param_name)
    fail "Parameter #{param_name} is required." if param.nil?
  end

  ##
  # Desc:   Utility method to be used when you need to wait for a particular
  #         block of code to return true, or timeout, whichever comes first.
  #
  # Params:
  #   timeout           - Optionally specify the number of seconds to timeout. Defaults to 30
  #   message           - Optionally specify a message that will be appended to the exception if
  #                       the method times out.
  #   &block    - Block of code to execute.
  #
  # Usage:
  #   Utils.wait_until do
  #     Some code that returns a boolean
  #   end
  #
  #   Utils.wait_until(5, "waiting for control to be enabled") do
  #     Some code that returns a boolean
  #   end
  ##
  def self.wait_until(timeout = 30, message = nil, &_block)
    end_time = Time.now + timeout
    until Time.now > end_time
      result = yield(self)
      return result if result
      sleep 0.5
    end
    fail Timeout::Error, "Timeout occurred after #{timeout} seconds #{message}"
  end

  ##
  # Desc: Utility method to return the innerHTML of a specified element
  #
  # Params:
  #   element     - The element to get innerHTML for.
  ##
  def self.get_inner_html(element)
    Utils.throw_if_nil(element, 'element')

    element.native.attribute('innerHTML')
  end
end
