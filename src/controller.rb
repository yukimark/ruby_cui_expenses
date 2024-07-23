require_relative 'models/spend'
require_relative 'module/view'

def add_spend
  View.line(2)
  spend = Spend.new()
  spend.category = View.spend_category
  View.line(2)
  puts '金額を入力してください。'
  spend.price = gets.chomp.to_i
  View.line(2)
  spend.fixedcost = View.boolean('固定費ですか?')
  View.line(2)
  spend.deferredpay = View.boolean('カードなどの後払いですか?')
  spend.save
end

def all_spend
  spends = Spend.all
  spends
end
