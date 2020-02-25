class Patient::V1::HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show]

  def index
    @hospitals = paginate Patient::V1::Hospital.order(id: sort_order(params[:_order])), per_page: params[:_limit]
    api each_serializer @hospitals, Patient::V1::HospitalSerializer
  end

  def show
    api serializer @hospital, Patient::V1::HospitalSerializer
  end

  private
  def set_hospital
    @hospital = validate_params Patient::V1::Hospital.find(params[:id])
  end
end
