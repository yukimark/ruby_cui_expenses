require_relative 'models/spend'
require_relative 'module/view'

def add_spend
  View.line(2)
  spend = Spend.new
  spend.category = View.spend_category
  View.line(2)
  loop do
    View.color_message('金額を入力してください。', :green)
    spend.price = gets.chomp.to_i
    break if spend.input_price_validate

    View.line(2)
    View.color_message('金額は1から999,999,999までの数字を入力する必要があります。', :red)
  end
  View.line(2)
  spend.fixedcost = View.boolean('固定費ですか?')
  View.line(2)
  spend.deferredpay = View.boolean('カードなどの後払いですか?')
  View.line(2)
  if View.confirm(content: spend, message: '上記の内容で登録しますか?') && spend.save
    View.color_message('保存しました。', :green)
  else
    View.color_message('保存できませんでした。', :green)
  end
end

def all_spend
  Spend.all
end
