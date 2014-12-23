

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module JimJamCrafts
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    #
    config.filepicker_rails.api_key =  ENV["FILEPICKER_API_KEY"]

    config.paperclip_defaults = {
      :storage => :s3,
      :s3_protocol => 'http',
      :url =>':s3_domain_url',
      :path => ":class/:id.:extension",
      :s3_host_name => 's3-us-west-2.amazonaws.com',
      
      # :s3_credentials => {
      #   :bucket => ENV['AWS_BUCKET'], #these values safely stored in application.yml thanks to figaro!
      #   :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      #   :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
      # }

      :s3_credentials => {
        :bucket => Rails.application.secrets.aws_bucket, #these values safely stored in application.yml thanks to figaro!
        :access_key_id => Rails.application.secrets.access_key_id,
        :secret_access_key => Rails.application.secrets.secret_access_key
      }
    }

    config.assets.paths << "#{Rails.root}/app/assets/templates"
  end
end
