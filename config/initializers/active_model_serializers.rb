ActiveModelSerializers.config.adapter = :attribute
ActiveModelSerializers.logger = Logger.new(STDOUT) unless Rails.env.test?
