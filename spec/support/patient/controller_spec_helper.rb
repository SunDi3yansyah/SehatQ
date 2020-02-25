module Patient::ControllerSpecHelper
  def patient_token_generator(patient_id)
    token = JsonWebToken.encode({ patient_id: patient_id })
    FactoryBot.create(
      :patient_v1_patient_token,
      patient_id: patient_id,
      token: token
    )
    return token
  end

  def petg(patient_id)
    JsonWebToken.encode({ patient_id: patient_id, exp: Time.now.to_i - 10 })
  end
  alias patient_expired_token_generator petg

  def patient_valid_headers
    {
      'Content-Type' => 'application/json',
      'X-AUTH-TOKEN' => patient_token_generator(patient.id)
    }
  end

  def pvhwj
    {
      'Content-Type' => 'application/json'
    }
  end
  alias patient_valid_headers_without_jwt pvhwj

  def patient_invalid_headers
    {
      'Content-Type' => nil
    }
  end
end
