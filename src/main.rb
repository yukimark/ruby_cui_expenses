require_relative 'module/view'
require_relative 'controller'
require_relative 'module/db'

def main
  DB.connect
  loop do
    menu_num = View.top

    case menu_num
    when 1
      add_spend
    when 2
      spends = all_spend
      # View.spend_index(spends)
      p spends
    when 3
      p 'アプリを終了します'
      break
    end
  end
end

main
