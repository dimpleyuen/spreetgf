module Spree
  AppConfiguration.class_eval do
    # Default mail headers settings
    preference :mails_from, :string, default: 'info@theglassformula.com'
    preference :enable_mail_delivery, :boolean, default: true
    preference :mail_bcc, :string, default: nil
    preference :intercept_email, :string, default: nil

    # Default smtp settings
    preference :mail_host, :string, default: 'theglassformula'
    preference :mail_domain, :string, default: 'smtp.gmail.com'
    preference :mail_port, :integer, default: 25
    preference :secure_connection_type, :string, default: Core::MailSettings::SECURE_CONNECTION_TYPES[0]
    preference :mail_auth_type, :string, default: Core::MailSettings::MAIL_AUTH[1]
    preference :smtp_username, :string, default: 'info@theglassformula.com'
    preference :smtp_password, :string, default: ''

    def override_actionmailer_config
      raise 'override_actionmailer_config has been removed. ' \
            'actionmailer\'s config is always overwridden when spree_mail_settings is included'
    end
    alias_method :override_actionmailer_config=, :override_actionmailer_config
  end
end
