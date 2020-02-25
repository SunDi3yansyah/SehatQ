class Patient::V1::PatientsController < ApplicationController
  before_action :set_patient, only: [:show]

  def index
    @patients = paginate Patient::V1::Patient.order(id: sort_order(params[:_order])), per_page: params[:_limit]
    api each_serializer @patients, Patient::V1::PatientSerializer
  end

  def show
    api serializer @patient, Patient::V1::PatientSerializer
  end

  private
  def set_patient
    @patient = validate_params Patient::V1::Patient.find(params[:id])
  end
end
