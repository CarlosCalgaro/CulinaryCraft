require 'test_helper'

class ApplicationServiceTest < ActiveSupport::TestCase
  class SampleService < ApplicationService
    attr_accessor :result

    def initialize(result)
      @result = result
      super()
    end

    def call
      "Service executed with result: #{@result}"
    end
  end

  test 'call method initializes a new instance and calls the service' do
    result = SampleService.call('Test Result')
    expected_output = 'Service executed with result: Test Result'
    assert_equal expected_output, result
  end

  test 'call method handles services with different arguments' do
    result1 = SampleService.call('Result 1')
    result2 = SampleService.call('Result 2')

    assert_equal 'Service executed with result: Result 1', result1
    assert_equal 'Service executed with result: Result 2', result2
  end
end
