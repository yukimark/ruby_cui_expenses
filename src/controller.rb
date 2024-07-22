require_relative 'models/spend'
require_relative 'module/view'

def add_spend
  spend = Spend.new()
  spend.category = View.spend_category
  puts '金額を入力してください。'
  spend.price = gets.chomp.to_i
  spend.fixedcost = View.boolean('固定費ですか?')
  spend.deferredpay = View.boolean('カードなどの後払いですか?')
  spend.save
end

def all_spend
  spends = Spend.all
  spends
end
