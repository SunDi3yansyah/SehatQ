unless Patient::V1::Patient.all.present?
  Patient::V1::Patient.create!(
    name: (Faker::Name.first_name + ' ' + Faker::Name.last_name).gsub(/[^a-zA-Z0-9.\s]/, ''),
    email: Faker::Internet.unique.free_email,
    phone: Faker::Number.leading_zero_number(digits: 12),
    password: 'secure',
    active: true
  )
end

unless Patient::V1::Doctor.all.present?
  Patient::V1::Doctor.create!(
    name: 'Dr. ' + (Faker::Name.first_name + ' ' + Faker::Name.last_name).gsub(/[^a-zA-Z0-9.\s]/, ''),
    email: Faker::Internet.unique.free_email,
    phone: Faker::Number.leading_zero_number(digits: 12)
  )
end

unless Patient::V1::Hospital.all.present?
  Patient::V1::Hospital.create!(
    name: Faker::Company.name,
    address: Faker::Address.full_address
  )
end

unless Patient::V1::Schedule.all.present?
  Patient::V1::Schedule.create!(
    hospital_id: Patient::V1::Hospital.ids.sample,
    doctor_id: Patient::V1::Doctor.ids.sample,
    day: (Time.now + 1.days).strftime('%A'),
    time: (Time.now + 1.days).strftime('%H:%M')
  )
end

unless Patient::V1::Booking.all.present?
  Patient::V1::Booking.create!(
    hospital_id: Patient::V1::Hospital.ids.sample,
    doctor_id: Patient::V1::Doctor.ids.sample,
    patient_id: Patient::V1::Patient.ids.sample,
    time: Time.now + 3.hours
  )
end
