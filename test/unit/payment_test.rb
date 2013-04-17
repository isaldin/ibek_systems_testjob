require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  test 'card_number is valid' do
    @payment = Payment.new(:credit_card_number => '4244671320161090')
    assert @payment.valid?
  end

  test 'card_number have incorrect format' do
    @payment = Payment.new(:credit_card_number => 'asdfsdf34534')
    assert @payment.invalid?
  end

  test 'card_number is not valid' do
    @payment = Payment.new(:credit_card_number => '4244671328161990')
    assert @payment.invalid?, 'failed'
  end
end
