class Payment < ActiveRecord::Base
  validates :credit_card_number, :uniqueness => true
  validate :verify_card_number

  attr_accessible :credit_card_number

  def verify_card_number
    if self[:credit_card_number] !~ /^[0-9]{16}$/
      errors.add(:credit_card_number, 'Input data doesn\'t match required format!')
    else
      dst = self[:credit_card_number].split(//).each_with_index.map{ |el, i|
        if i%2==0 then (r = el.to_i*2) > 9 ? (r - 9) : (r) else el.to_i end
      }
      #ruby 1.9 way
      errors.add(:credit_card_number, 'Wrong') if dst.inject(:+) % 10 != 0
      #or you can use dst.inject{ |result, el| result + el} instead of dst.inject(:+)
    end
  end
end
