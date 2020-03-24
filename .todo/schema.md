# patients
- name
- email
- phone
- password_digest
- active:boolean

# patient_tokens
- patient:references
- token

# doctors
- name
- email
- phone

# hospitals
- name
- address

# schedules
- hospital:references
- doctor:references
- day
- time

# bookings
- hospital:references
- doctor:references
- patient:references
- time:datetime
