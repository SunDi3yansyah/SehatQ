module ApplicationHelper
  # @param [Object] param
  # @return [Object]
  def validate_params(param = nil)
    if param.present?
      param
    else
      return http_status(404)
    end
  rescue
    return http_status(404)
  end

  # @param [Object] message
  # @return [Object]
  def validation_message(message)
    message.gsub('Validation failed: ', '').split(', ').first
  end

  # @param [Object] code
  # @return [String]
  def http_status_codes(code)
    case code
      when 100
        'Continue'
      when 101
        'Switching Protocols'
      when 102
        'Processing'
      when 200
        'OK'
      when 201
        'Created'
      when 202
        'Accepted'
      when 203
        'Non-Authoritative Information'
      when 204
        'No Content'
      when 205
        'Reset Content'
      when 206
        'Partial Content'
      when 207
        'Multi-Status'
      when 208
        'Already Reported'
      when 226
        'IM Used'
      when 300
        'Multiple Choices'
      when 301
        'Moved Permanently'
      when 302
        'Found'
      when 303
        'See Other'
      when 304
        'Not Modified'
      when 305
        'Use Proxy'
      when 307
        'Temporary Redirect'
      when 308
        'Permanent Redirect'
      when 400
        'Bad Request'
      when 401
        'Unauthorized'
      when 402
        'Payment Required'
      when 403
        'Forbidden'
      when 404
        'Not Found'
      when 405
        'Method Not Allowed'
      when 406
        'Not Acceptable'
      when 407
        'Proxy Authentication Required'
      when 408
        'Request Timeout'
      when 409
        'Conflict'
      when 410
        'Gone'
      when 411
        'Length Required'
      when 412
        'Precondition Failed'
      when 413
        'Payload Too Large'
      when 414
        'URI Too Long'
      when 415
        'Unsupported Media Type'
      when 416
        'Range Not Satisfiable'
      when 417
        'Expectation Failed'
      when 421
        'Misdirected Request'
      when 422
        'Unprocessable Entity'
      when 423
        'Locked'
      when 424
        'Failed Dependency'
      when 426
        'Upgrade Required'
      when 428
        'Precondition Required'
      when 429
        'Too Many Requests'
      when 431
        'Request Header Fields Too Large'
      when 451
        'Unavailable for Legal Reasons'
      when 500
        'Internal Server Error'
      when 501
        'Not Implemented'
      when 502
        'Bad Gateway'
      when 503
        'Service Unavailable'
      when 504
        'Gateway Timeout'
      when 505
        'HTTP Version Not Supported'
      when 506
        'Variant Also Negotiates'
      when 507
        'Insufficient Storage'
      when 508
        'Loop Detected'
      when 510
        'Not Extended'
      when 511
        'Network Authentication Required'
      else
        nil
    end
  end

  # @param [Object] params
  # @param [Object] priority
  # @return [Object]
  def sort_order(params = nil, priority = nil)
    case params
      when 'asc'
        params
      when 'desc'
        params
      else
        if priority.nil?
          'desc'
        else
          priority
        end
    end
  rescue
    'desc'
  end
end
