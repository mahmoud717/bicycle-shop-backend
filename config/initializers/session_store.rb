if Rails.env == "production" 
    Rails.application.config.session_store :cookie_store, expire_after: 14.days, key: '_interslice_session' 
else
    Rails.application.config.session_store :cookie_store, expire_after: 14.days ,key: '_interslice_session', same_site: :none, secure: true
end