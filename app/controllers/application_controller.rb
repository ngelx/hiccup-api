# encoding: utf-8
# frozen_string_literal: true
class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  include DeviseTokenAuth::Concerns::SetUserByToken

  before_filter :set_default_response_format

  private
    def set_default_response_format
      request.format = :json
    end
end
