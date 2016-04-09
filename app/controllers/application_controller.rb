# encoding: utf-8
# frozen_string_literal: true
class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :set_default_response_format

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::RoutingError, with: :client_error
  rescue_from RuntimeError, with: :internal_server_error

  private

  def set_default_response_format
    request.format = :json
  end

  def record_not_found(error)
    render json: { error: error.message }, status: :not_found
  end

  def internal_server_error(exception)
    logger.error "#{exception.message} #{exception.backtrace.join("\n")}"
    # Rollbar.report_exception(e)
    render json: { error: exception.message }, status: 500
  end

  def client_error(exception)
    logger.error "#{exception.message} #{exception.backtrace.join("\n")}"
    render json: { error: 'bad request' }, status: 400
  end
end
