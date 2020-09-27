class Patient::V1::SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show]

  def index
    @schedules = paginate Patient::V1::Schedule.includes(:hospital, :doctor)
                  .order(id: sort_order(params[:_order])), per_page: params[:_limit]
    api each_serializer @schedules, Patient::V1::ScheduleSerializer
  end

  def show
    api serializer @schedule, Patient::V1::ScheduleSerializer
  end

  private

  def set_schedule
    @schedule = validate_params Patient::V1::Schedule.find(params[:id])
  end
end
