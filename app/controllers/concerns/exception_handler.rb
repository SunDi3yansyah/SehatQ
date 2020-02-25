module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from NoMemoryError, ScriptError, SignalException, StandardError, SystemExit do |exception|
      api({ message: http_status_codes(500) }, 500)
    end

    rescue_from Net::ReadTimeout do |exception|
      api({ message: http_status_codes(500) }, 500)
    end

    rescue_from Net::OpenTimeout do |exception|
      api({ message: http_status_codes(500) }, 500)
    end

    rescue_from ActionController::InvalidAuthenticityToken do |exception|
      api({ message: http_status_codes(500) }, 500)
    end

    rescue_from ActionController::UnknownFormat do |exception|
      api({ message: http_status_codes(500) }, 500)
    end

    rescue_from ActiveRecord::RecordNotUnique do |exception|
      api({ message: http_status_codes(500) }, 500)
    end

    rescue_from ActiveRecord::MigrationError do |exception|
      api({ message: http_status_codes(500) }, 500)
    end

    rescue_from ActionController::RoutingError do |exception|
      api({ message: http_status_codes(404) }, 404)
    end

    rescue_from ActiveRecord::RecordNotFound do |exception|
      api({ message: http_status_codes(404) }, 404)
    end

    rescue_from JSON::ParserError do |exception|
      api({ message: http_status_codes(422) }, 422)
    end

    rescue_from ActionController::ParameterMissing do |exception|
      api({ message: http_status_codes(422) }, 422)
    end

    rescue_from ActiveRecord::RecordInvalid do |exception|
      api({ message: validation_message(exception.message) }, 422)
    end

    rescue_from ActiveRecord::InvalidForeignKey do |exception|
      api({ message: 'Foreign key is not present in table' }, 422)
    end
  end

  private
  # @param [Array] args
  # @return [Object]
  def process_action(*args)
    super
  rescue ActionDispatch::Http::Parameters::ParseError => exception
    api({ message: http_status_codes(400) }, 400)
  end
end
