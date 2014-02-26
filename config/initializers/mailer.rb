if Rails.env.test? && AppSettings.table_exists?
  Configuration::Mailer.settings =
    {test: {from: 'test@houstonize.com', scheduler_email: 'test@houstonize.com'}}
end
