# Webpay::Scaffold

Scaffold for WebPay.

## Installation

Add this line to your application's Gemfile:

    gem 'webpay-scaffold'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install webpay-scaffold

## Usage

### Generate

```
rails g webpay:scaffold
----------
      create  config/initializers/web_pay.rb
      create  db/migrate/20010101000000_create_payments.rb
      create  db/migrate/20010102000000_create_cards.rb
      create  app/models/card.rb
      create  app/models/payment.rb
      create  app/models/web_pay_connect.rb
      create  config/settings.yml
----------
```

### Destroy

```
rails destroy webpay:scaffold
----------
      remove  config/initializers/web_pay.rb
      remove  db/migrate/20010101000000_create_payments.rb
      remove  db/migrate/20010102000000_create_cards.rb
      remove  app/models/card.rb
      remove  app/models/payment.rb
      remove  app/models/web_pay_connect.rb
      remove  config/settings.yml
----------
```

### Sample

app/controllers/top_controller.rb

```rb
class TopController < ApplicationController

  # トップ
  def index
    # 新しい課金の作成
    card = {
      number:    "4242424242424242",
      exp_month: "11",
      exp_year:  "2014",
      cvc:       "123",
      name:      "SHUN MATSUMOTO",
    }
    response, card = WebPayConnect.charge_create(100, card, 'プレミアム料')
    payment = Payment.create(response.merge(user_id: current_user.try(:id)))
    card    = Card.create(card.merge(user_id: current_user.try(:id)))

    # 課金情報の取得
    response = WebPayConnect.charge_retrieve('ch_gNP3TE4GB0bC6eX')

    # 課金リストの取得
    response = WebPayConnect.charge_list(5, 10)
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
