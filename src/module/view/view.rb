require_relative '../../setup'

module View
  class << self
    def color_message(message:, color:, y_coordinate: nil, x_coordinate: nil)
      Curses.setpos(y_coordinate, x_coordinate) if y_coordinate.present? && x_coordinate.present?
      Curses.attron(Curses.color_pair(color)) do
        Curses.addstr(message)
      end
      Curses.attrset(0)
    end

    def confirm(content: nil, message: '進めていいですか?')
      if content.is_a?(ActiveRecord::Base) # modelを想定している
        excluded_attributes = %w[id created_at updated_at]
        attributes = content.attributes.except(*excluded_attributes)
        View.color_message('確認画面です。', :green)
        attributes.each do |key, value|
          value_bool = value.is_a?(FalseClass) || value.is_a?(TrueClass)
          puts "#{I18n.t(key)}: #{value_bool ? I18n.t(value) : value}"
        end
      end
      View.line(3)
      View.boolean(message)
    end

    def top
      choices = {
        'a' => 'お小遣い帳入力',
        's' => 'お小遣い帳一覧',
        'l' => 'お小遣い帳削除',
        ';' => '終了する'
      }

      select_menu(message: I18n.t('menu.select'), choices: choices)
    end

    def boolean(desc)
      choices = {
        'y' => 'Yes',
        'n' => 'No'
      }

      choice = select_menu(message: desc, choices: choices, y_coordinate: y, x_coordinate: x)
      choice == 'y'
    end

    def delete_spend_menu
      choices = {
        'a' => '直前の1件を削除',
        's' => 'IDを指定して削除'
      }

      select_menu(message: I18n.t('menu.select'), choices: choices)
    end

    def spend_index(_spends)
      p Spend.all
    end

    def shutdown
      y = CURSES_Y_INITIAL
      x = CURSES_X_INITIAL
      Curses.setpos(y, x)
      View.color_message(message: '1秒後にアプリを終了します。', color: CURSES_COLOR_YELLOW)
      Curses.refresh
      sleep(0.7)
    end
  end
end

private

def select_menu(message:, choices:, y_coordinate: CURSES_Y_INITIAL, x_coordinate: CURSES_X_INITIAL)
  input_key = nil
  loop do
    y = 1
    x = 1
    Curses.setpos(y, x)
    View.color_message(message: message, color: CURSES_COLOR_GREEN)
    Curses.setpos(y += 1, x)
    choices.each do |key, value|
      Curses.addstr("#{key}: #{value}")
      y += 1
      Curses.setpos(y, x)
    end
    Curses.setpos(y += 1, x)
    loop do
      View.color_message(message: '選択肢に対応したキーを入力してください。', color: CURSES_COLOR_GREEN)
      Curses.refresh
      Curses.setpos(y += 1, x)
      input_key = Curses.getstr
      break input_key if choices.key?(input_key)

      Curses.setpos(y += 1, x)
      View.color_message(message: 'キーが間違っています。', color: CURSES_COLOR_RED)
      Curses.setpos(y += 1, x)
      break if Curses.lines <= y
    end
    if Curses.lines <= y
      Curses.clear
      next
    end
    break input_key if choices.key?(input_key)
  end
  Curses.clear
  input_key
end
