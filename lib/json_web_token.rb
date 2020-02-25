require 'jwt'

class JsonWebToken
  def self.encode(payload)
    payload.reverse_merge!(meta)
    JWT.encode(payload, ENV["SECRET_TOKEN"])
  end

  def self.decode(token)
    JWT.decode(token, ENV["SECRET_TOKEN"])
  end

  def self.valid_payload(payload)
    if expired(payload) || payload['iss'] != meta[:iss] || payload['aud'] != meta[:aud]
      return false
    else
      return true
    end
  end

  def self.meta
    {
      exp: 1.months.from_now.to_i,
      iss: JWT_META_ISS,
      aud: JWT_META_AUD,
    }
  end

  def self.expired(payload)
    Time.at(payload['exp']) < Time.now
  end
end
