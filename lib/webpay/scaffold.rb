require "webpay/scaffold/version"
require 'rails/generators'
require 'webpay'
require 'rails_config'

module Webpay
  module Scaffold
    class ScaffoldGenerator < Rails::Generators::Base
      @@template_path = source_root File.expand_path( "../scaffold/templates", __FILE__ )

      def generate_scaffold
        app_name = Rails.application.class.name.split('::').first

        ## config/initializers
        copy_file( "#{@@template_path}/initializers/web_pay.rb", "config/initializers/web_pay.rb" )

        ## db/migrate
        copy_file( "#{@@template_path}/migrate/create_payments.rb", "db/migrate/20010101000000_create_payments.rb" )
        copy_file( "#{@@template_path}/migrate/create_cards.rb", "db/migrate/20010102000000_create_cards.rb" )

        ## models
        copy_file( "#{@@template_path}/models/card.rb", "app/models/card.rb" )
        copy_file( "#{@@template_path}/models/payment.rb", "app/models/payment.rb" )
        copy_file( "#{@@template_path}/models/web_pay_connect.rb", "app/models/web_pay_connect.rb" )

        ## settings
        content = "\n# WebPay API Key\n"
        content += "web_pay_api_key: 'test_secret_5ete0yfRC3g67ndfMm0kC1S9'\n"
        content += "web_pay_currency: 'jpy'\n"
        append_file( "config/settings.yml", content.force_encoding('ASCII-8BIT') )
      end
    end
  end
end
