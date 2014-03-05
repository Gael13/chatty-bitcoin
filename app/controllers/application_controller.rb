class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :show_demo_bar?, :site_data, :site_locked?

  private

  def find_user
  	User.find(params[:user_id] || params[:id])
  end	

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def ensure_site_unlocked
  	if Site.locked_to_owner?
  	  flash[:error] = "That action cannot be performed as the site has been locked."
  	  redirect_to root_path
  	end
  end

  def show_demo_bar?
    Chatty::Services.demo_mode?
  end
  
  def site_locked?
    site_data.present? && site_data.locked_to_owner?
  end
  
  def site_data
    @site_data ||= Site.data 
  end
  
  def allowed_params(context)
    raise "Must be overriden in subclasses to use #filtered_params"
  end
  
  def filtered_params(key, context = nil)
    hash = params[key]

    if hash.respond_to?(:slice)
      extra_keys = hask.keys - allowed_params(context)
      unless extra_keys.empty?
        raise "Params supplied that will be filtered: #{extra_keys.join(', ')}"
      end

      hash.slice(*allowed_params(context)).with_indifferent_access
    else
      {}
    end            	  
  end
end
