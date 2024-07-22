require_relative 'module/view'

def main
  loop do
    menu_num = View.top

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
