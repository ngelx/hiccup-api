class TripsController < ApplicationController

  def index
    @trips = Trip.paginate(page: params[:page], per_page: params[:per_page])
    render json: @trips
  end

  def create
    @trip = Trip.new(params_trip)
    if @trip.save!
      @trip.auto_create_intineraries
      @trip.auto_create_share
      render 'show', formats: [:json], handlers: [:jbuilder], status: 201
    else
      render json: @trip.errors, status: 422
    end
  end

  def updated
  end

  def show
  end

  def delete
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
end
