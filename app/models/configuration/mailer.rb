module Configuration
  module Mailer
    def self.configured?
      !!settings
    end

    def self.settings
      return unless AppSettings.mailer
      AppSettings.mailer[Rails.env.to_sym]
    end

    def self.settings=(hash)
      AppSettings.mailer = hash
    end
  end
end
