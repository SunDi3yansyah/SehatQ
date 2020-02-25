class Patient::V1::BookingsController < ApplicationController
  before_action :authenticate_jwt, only: [:create]
  before_action :set_booking, only: [:show]

  def index
    @bookings = paginate Patient::V1::Booking.order(id: sort_order(params[:_order])), per_page: params[:_limit]
    api each_serializer @bookings, Patient::V1::BookingSerializer
  end

  def show
    api serializer @booking, Patient::V1::BookingSerializer
  end

  def create
    @booking = Patient::V1::Booking.new(booking_params)

    maximum_time = Patient::V1::Schedule
                     .where(hospital_id: booking_params[:hospital_id], doctor_id: booking_params[:doctor_id])
                     .where(day: DateTime.parse(booking_params[:time]).strftime('%A'))
    compare = Time.parse(maximum_time.first.time).to_i - Time.parse(DateTime.parse(booking_params[:time]).strftime('%H:%M')).to_i <= 1800 if maximum_time.present?

    return api({ message: 'Maximum patient can book within 30 minutes before the doctor starts the schedule' }, 422) if compare

    booking_limit = Patient::V1::Booking
                      .where(hospital_id: booking_params[:hospital_id], doctor_id: booking_params[:doctor_id])
                      .where('time LIKE ?', "#{DateTime.parse(booking_params[:time]).strftime('%Y-%m-%d %H:%M')}%")

    return api({ message: 'Has exceeded the limit' }, 422) if booking_limit.count >= 10

    if @booking.save
      api serializer(@booking, Patient::V1::BookingSerializer), 201
    else
      api({ message: @booking.errors.full_messages.first }, 422)
    end
  end

  private
  def set_booking
    @booking = validate_params Patient::V1::Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:hospital_id, :doctor_id, :time).merge(patient_id: patient_id)
  end
end
