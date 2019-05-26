require_relative 'boot'

require 'rails/all'

require File.expand_path('../boot', __FILE__)  #リスト14.37

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.

Bundler.require(*Rails.groups)

module Sample03App  #リスト14.37　によると　SampleApp となっている大丈夫か？
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    # 認証トークンをremoteフォームに埋め込む
    config.action_view.embed_authenticity_token_in_remote_forms = true #リスト14.37
  end
end
