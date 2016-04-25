# encoding: utf-8
# frozen_string_literal: true
class TripsController < ApplicationController
  def index
    @trips = Trip.paginate(page: params[:page], per_page: params[:per_page])
    render 'index', formats: [:json], handlers: [:jbuilder], status: 200
  end

  def create
    if params[:trip]
      params[:trip][:local_contact_attributes] = {}
      params[:trip][:local_contact_attributes][:name] = params[:trip][:local_contact_name]
      params[:trip][:local_contact_attributes][:email] = params[:trip][:local_contact_email]
      params[:trip][:local_contact_attributes][:phone] = params[:trip][:local_contact_phone]
      @trip = Trip.new(params_trip)
      if @trip.save
        @trip.auto_create_intineraries
        @trip.auto_create_share
        render 'create', formats: [:json], handlers: [:jbuilder], status: 201
      else
        render json: {error: @trip.errors}, status: 422
      end
    else
      render json: { error: 'missing trip argument' }, status: 400
    end
  end

  def update
#    if params[:trip] && params[:update_token]
#      @trip = Trip.find_by!(id: params[:id], update_token: params[:update_token])
    if params[:trip]
      @trip = Trip.find_by!(id: params[:id])

      if @trip.update(params_trip)
        render 'create', formats: [:json], handlers: [:jbuilder], status: 201
      else
        render json: {error: @trip.errors}, status: 422
      end
    else
      render json: { error: 'missing argument' }, status: 400
    end
  end

  # kind of weird, it is not a standar show action ..
  def show
    share = Share.find_by!(public_url: params[:id])
    @trip = share.trip
    render 'show', formats: [:json], handlers: [:jbuilder], status: 200
  end

  def private
    if params[:password]
      share = Share.find_by!(private_url: params[:id]).authenticate(params[:password])
      raise ActiveRecord::RecordNotFound unless share

      @trip = share.trip
      render 'show', formats: [:json], handlers: [:jbuilder], status: 200
    else
      render json: { error: 'missing argument' }, status: 400
    end
  end

  def password
    if params[:share] && params[:share][:password] && !params[:share][:password].empty? && params[:update_token]
      trip = Trip.find_by!(id: params[:id], update_token: params[:update_token])
      share = trip.share
      if share.update(params_share)
        head :ok
      else
        render json: { error: share.errors.full_messages }, status: 422
      end
    else
      render json: { error: 'missing argument' }, status: 400
    end
  end

  private

  def params_trip
    params.require(:trip).permit(
      :name,
      :organizator,
      :start_date,
      :end_date,
      :start_location,
      :end_location,
      :goal,
      :route,
      :transportation,
      :comunication,
      :freak_out,
      :in_reach_map,
      :agency,
      :fees,
      :stove_fuel,
      :transportation_time,
      :direction_out,
      :condition_caution,
      :animal_caution,
      :plant_caution,
      :fly_issue,
      :supermarket,
      :outdoor_store,
      local_contact_attributes: [
        :name,
        :email,
        :phone
      ]
    )
  end

  def params_share
    params.require(:share).permit(
      :password
    )
  end
end
