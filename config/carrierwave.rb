CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_KEY'],
    :aws_secret_access_key  => ENV['AWS_SECRET_KEY'],
    :region                 => ENV['AWS_REGION']
  }
  config.fog_directory  = ENV['AWS_BUCKET']
  config.fog_public     = true
  config.permissions = 0600
  config.storage(Rails.env.test? || Rails.env.development? ? :file : :fog)
end
