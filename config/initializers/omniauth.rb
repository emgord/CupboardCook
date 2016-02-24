Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
    :name => "google",
    :access_type => "online",
    :skip_jwt => true,
    :client_options => { :ssl => { :verify => false } }
  }
end
