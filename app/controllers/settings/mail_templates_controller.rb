class Settings::MailTemplatesController < Settings::Base
  before_filter :authenticate_user!, :require_permission

  def edit
    @users_for_select = User.order("name ASC").collect{ |c|
      [c.name, c.email] if not c.email.blank?
    }.uniq.compact
  end

  def update
    if params[:auto_mail].present?
      AppSettings.auto_mail = params[:auto_mail]
      message = "You have set the application as #{AppSettings.auto_mail == 'on' ? 'AUTOMATICALLY SEND MAIL' : 'Manually SEND Mail' }!"
    else
      puts params
      params[:settings].each_pair do |setting, value|
        AppSettings.send(setting.to_s+"=", value)
      end
      message = "All mail settings are saved successfully!"
    end

    redirect_to :back, :notice => message
  end
end
