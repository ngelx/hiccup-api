# encoding: utf-8
# frozen_string_literal: true
RSpec.configure do |config|
  # additional factory_girl configuration

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end
