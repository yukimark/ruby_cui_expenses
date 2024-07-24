require 'active_record'

class Spend < ActiveRecord::Base
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 999999999 }

  def input_price_validate
    price.is_a?(Integer) && price >= 1 && price <= 999999999
  end
end
