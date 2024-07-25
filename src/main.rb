require_relative 'module/view/view'
require_relative 'controller'
require_relative 'setup'

def main
  setup
  loop do
    menu_str = View.top

    case menu_str
    when 'a'
      add_spend
    when 's'
      spends = all_spend
      View.spend_index(spends)
    when 'l'
      delete
    when ';'
      View.shutdown
      break
    end
  end
  Curses.close_screen
end

def delete
  if Spend.count.zero?
    View.error_message('お小遣い帳のデータは0件です。')
    return
  end
  menu_str = View.delete_spend_menu

  case menu_str
  when 'a'
    delete_spend_last
  when 's'
    delete_spend_find_id
  end
end

main
