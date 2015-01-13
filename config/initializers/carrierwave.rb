CarrierWave.configure do |config|
  config.storage = Rails.env.production? ? :fog : :file
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => Rails.env.production? ? ENV['S3_KEY'] : 'id',
    :aws_secret_access_key  => Rails.env.production? ? ENV['S3_SECRET'] : "secret"
  }
  config.fog_directory  = 'coshx-website'
  config.fog_public     = true
#  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
