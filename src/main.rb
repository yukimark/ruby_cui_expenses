require_relative 'show_display_menu'

def main
  loop do
    menu_num = display_menu_top

    case menu_num
    when 1
      p 'アプリを終了します'
      break
    when 2
      p 'アプリを終了します'
      break
    when 3
      p 'アプリを終了します'
      break
    end
  end
end

main
