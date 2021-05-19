class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :update_allowed_parameters, if: :devise_controller?
  
    protected
  #direttiva per salvare nel db anche nome e cognome
    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nome, :cognome,:telefono, :email, :password)}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:nome, :cognome, :telefono, :email, :password, :current_password)}
    end
end
