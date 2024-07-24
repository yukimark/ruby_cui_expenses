require_relative 'module/view'
require_relative 'controller'
require_relative 'setup'

def main
  setup
  loop do
    View.line(1)
    menu_str = View.top

    case menu_str
    when 'a'
      add_spend
      View.line(2)
    when 's'
      spends = all_spend
      View.spend_index(spends)
      View.line(2)
    when 'l'
      delete
    when ';'
      View.line(1)
      View.color_message('アプリを終了します。', :green)
      break
    end
  end
end

def delete
  View.line(1)
  if Spend.count.zero?
    View.color_message('お小遣い帳のデータは0件です。', :red)
    return
  end
  menu_str = View.delete_spend_menu

  case menu_str
  when 'a'
    delete_spend_last
    View.line(2)
  when 's'
    delete_spend_find_id
    View.line(2)
  end
end

main
