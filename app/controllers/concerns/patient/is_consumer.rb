module Patient::IsPatient
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_jwt
  end
end
