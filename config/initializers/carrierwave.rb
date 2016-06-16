CarrierWave.configure do |config|
  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  # Use AWS storage if in production
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
      config.fog_credentials = {
        # Configuration for Amazon S3 should be made available through an Environment variable.
        # For local installations, export the env variable through the shell OR
        # if using Passenger, set an Apache environment variable.
        #
        # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
        #
        # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

        # Configuration for Amazon S3
        :provider              => 'AWS',
        :aws_access_key_id     => ENV['S3_KEY'],
        :aws_secret_access_key => ENV['S3_SECRET'],
        :region                => ENV['S3_REGION']
      }
      config.fog_directory = ENV['S3_BUCKET_NAME']
    end
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku

end