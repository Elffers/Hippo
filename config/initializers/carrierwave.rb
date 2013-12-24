CarrierWave.configure do |config|

  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    # config.root = "#{Rails.root}/tmp"
 
  elsif Rails.env.production?
  config.storage = :fog
  config.fog_credentials = { 
    :provider               => 'AWS', 
    :aws_access_key_id      => Figaro.env.hippo_key, 
    :aws_secret_access_key  => Figaro.env.hippo_secret
  } 
  config.fog_directory  = ENV['ada-areyouhipponot']
  config.fog_public     = false 
  end

end