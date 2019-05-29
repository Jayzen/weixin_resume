module DeviseWhitelist
  extend ActiveSupport::Concern

  included do 
    before_action :configure_permitted_parameters, if: :devise_controller?  
  end

  def configure_permitted_parameters
    if ((controller_name=="registrations") && (action_name=="new")) 
      flash[:success] = "用户无权访问"
      redirect_to root_path
    else
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
  end
end
