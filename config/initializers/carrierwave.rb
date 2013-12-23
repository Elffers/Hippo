CarrierWave.configure do |config|

  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    # config.root = "#{Rails.root}/tmp"
 
  elsif Rails.env.production?
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave' 
  
  config.storage = :fog
  config.fog_credentials = { 
    :provider               => 'AWS', 
    :aws_access_key_id      => ENV['AKIAJT5LBD34DLGCK6LA'], 
    :aws_secret_access_key  => ENV['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'] 
  } 
  config.fog_directory  = ENV['ada-areyouhipponot']
  config.fog_public     = false 
  end

end