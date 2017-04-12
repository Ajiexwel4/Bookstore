require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_credentials = { provider: 'AWS', aws_access_key_id: Figaro.env.S3_SECRET_ID, 
                               aws_secret_access_key: Figaro.env.S3_SECRET_KEY, region: 'eu-west-2' }    
    config.fog_directory =  Figaro.env.S3_BUCKET_NAME
  else
    config.storage = :file
    config.enable_processing = false
  end                
end