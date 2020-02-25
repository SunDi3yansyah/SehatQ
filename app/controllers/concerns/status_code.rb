module StatusCode
  extend ActiveSupport::Concern

  included do
    # @return [Object]
    def index
      data = {
        message: "Welcome to API #{APP_NAME} (Test: Cahyadi Triyansyah)",
        initializers: {
          app_name: APP_NAME,
        }
      }
      api data
    end

    # @param [Object] code
    # @return [Object]
    def http_status(code = nil)
      code = code.present? ? code : params[:code].to_i
      if http_status_codes(code).present?
        api({ message: http_status_codes(code) }, code)
      else
        api({ message: 'Invalid HTTP Status Code' })
      end
    end

    # @return [Object]
    def exception
      api({ message: http_status_codes(500) }, 500)
    end

    # @return [Object]
    def status_code_404
      api({ message: http_status_codes(404) }, 404)
    end

    # @return [Object]
    def status_code_422
      api({ message: http_status_codes(422) }, 422)
    end

    # @return [Object]
    def status_code_500
      api({ message: http_status_codes(500) }, 500)
    end
  end
end
