## CHANGELOG: 0.1
rails g migration CreatePatient name email phone password_digest active:boolean
rails g migration CreatePatientToken patient:references token
rails g migration CreateDoctor name email phone
rails g migration CreateHospital name address
rails g migration CreateSchedule hospital:references doctor:references day time
rails g migration CreateBooking hospital:references doctor:references patient:references time:datetime

rails g scaffold Patient::V1::Patient name email phone password_digest active:boolean --no-migration --skip
rails g scaffold Patient::V1::PatientToken patient:references token --no-migration --skip
rails g scaffold Patient::V1::Doctor name email phone --no-migration --skip
rails g scaffold Patient::V1::Hospital name address --no-migration --skip
rails g scaffold Patient::V1::Schedule hospital:references doctor:references day time --no-migration --skip
rails g scaffold Patient::V1::Booking hospital:references doctor:references patient:references time:datetime --no-migration --skip

rails g model Patient::V1::Account::SignUp --skip-migration
rails g model Patient::V1::Account::SignIn --skip-migration

rails g controller Patient::Root index
rails g controller Patient::V1::Root index

rails g controller Patient::V1::Account::SignUp create
rails g controller Patient::V1::Account::SignIn create
