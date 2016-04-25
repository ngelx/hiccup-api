class IntinerariesController < ApplicationController

  def update
    if params[:intinerary]
      @intinerary = Intinerary.find_by!(id: params[:id])

      if @intinerary.update(params_intinerary)
        render 'update', formats: [:json], handlers: [:jbuilder], status: 201
      else
        render json: {error: @intinerary.errors}, status: 422
      end
    else
      render json: { error: 'missing argument' }, status: 400
    end
  end

  def params_intinerary
    params.require(:intinerary).permit(
      :start_location,
      :end_location,
      :start_time,
      :end_time,
      :water,
      :hammok,
      :fishing
    )
  end
end
