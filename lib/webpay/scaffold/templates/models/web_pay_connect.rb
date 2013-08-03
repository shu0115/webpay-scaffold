module WebPayConnect
  # 新しい課金の作成
  def self.charge_create(amount, card, description)
    WebPay.api_key = Settings.web_pay_api_key
    response = WebPay::Charge.create(
      amount: amount,
      currency: Settings.web_pay_currency,
      card: {
        number:    card[:number],
        exp_month: card[:exp_month],
        exp_year:  card[:exp_year],
        cvc:       card[:cvc],
        name:      card[:name],
      },
      description: description
    ).to_hash

    card = response['card']
    card['kind']             = card['type']
    card['last_four_number'] = card['last4']
    card.delete('type')
    card.delete('last4')

    response['provider']       = 'WebPay'
    response['transaction_id'] = response['id']
    response['created']        = Time.at(response['created']) rescue nil
    response.delete('id')
    response.delete('card')

    return response, card
  end

  # 課金情報の取得
  def self.charge_retrieve(transaction_id)
    WebPay.api_key = Settings.web_pay_api_key
    response = WebPay::Charge.retrieve(transaction_id).to_hash

    return response
  rescue => e
    return e.message
  end

  # 課金リストの取得
  def self.charge_list(count=10, offset=0, created=nil, customer=nil)
    WebPay::Charge.all(count: count, offset: offset, created: created, customer: customer).map{ |x| x.to_hash }
  end
end
