class Patient::V1::DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show]

  def index
    @doctors = paginate Patient::V1::Doctor.order(id: sort_order(params[:_order])), per_page: params[:_limit]
    api each_serializer @doctors, Patient::V1::DoctorSerializer
  end

  def show
    api serializer @doctor, Patient::V1::DoctorSerializer
  end

  private
  def set_doctor
    @doctor = validate_params Patient::V1::Doctor.find(params[:id])
  end
end
