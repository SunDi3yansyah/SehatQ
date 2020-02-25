module Response
  extend ActiveSupport::Concern

  included do
    include ActionController::Helpers
  end

  private
  # @param [Object] data
  # @param [Integer] status
  # @param [Object] location
  # @return [Object]
  def api(data, status = 200, location = nil)
    render json: {
      response: {
        status: status,
        message: http_status_codes(status),
        url: request.original_url
      },
      data: data.nil? ? nil : (JSON.parse(data) rescue data)
    }, status: status, location: location
  end

  # @param [Object] message
  # @param [Integer] code
  # @return [Object]
  def http_message(message = nil, code = 200)
    if code.present?
      api({ message: message }, code)
    else
      api({ message: message })
    end
  end

  # @param [Object] resource
  # @param [Object] serializer
  # @param [Hash{null->null}] options
  # @return [ActiveModelSerializers::SerializableResource]
  def each_serializer(resource, serializer, options = {})
    ActiveModelSerializers::SerializableResource.new(resource, each_serializer: serializer, options: options)
  end

  # @param [Object] resource
  # @param [Object] serializer
  # @param [Hash{null->null}] options
  # @return [ActiveModelSerializers::SerializableResource]
  def serializer(resource, serializer, options = {})
    ActiveModelSerializers::SerializableResource.new(resource, serializer: serializer, options: options)
  end
end
