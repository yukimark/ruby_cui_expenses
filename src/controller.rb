require_relative 'models/spend'
require_relative 'module/view'

def add_spend
  View.line(2)
  spend = Spend.new()
  spend.category = View.spend_category
  View.line(2)
  title_price = HighLine.new
  puts title_price.color('金額を入力してください。', :green)
  spend.price = gets.chomp.to_i
  View.line(2)
  spend.fixedcost = View.boolean('固定費ですか?')
  View.line(2)
  spend.deferredpay = View.boolean('カードなどの後払いですか?')
  View.line(2)
  if View.confirm(content: spend, message: '上記の内容で登録しますか?')
    spend.save
  else
    puts '保存できませんでした。'
    return
  end
end

def all_spend
  spends = Spend.all
  spends
end
