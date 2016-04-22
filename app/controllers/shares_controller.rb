class SharesController < ApplicationController
  def index
    if params[:password] and params[:private_url]
      @share = nil

      #begin
        @share = Share.find_by!(private_url: params[:private_url]).authenticate(params[:password])
      #rescue
      #  raise ActiveRecord::RecordNotFound
      #end

      raise ActiveRecord::RecordNotFound unless @share

      @trip = @share.trip
      render 'show', formats: [:json], handlers: [:jbuilder], status: 200
    else
      render json: { error: 'missing argument' }, status: 400
    end
  end
end
