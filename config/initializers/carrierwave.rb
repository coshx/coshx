CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['S3_KEY'],
    :aws_secret_access_key  => ENV['S3_SECRET']
  }
  config.fog_directory  = 'coshx-website'
  config.fog_public     = true
#  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end
