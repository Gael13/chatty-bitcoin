OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :facebook, '216290755193549', '6e724bdefb73f74d835efc4ecc851287'	
end