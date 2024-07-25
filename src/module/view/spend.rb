require_relative '../../setup'

module View
  module SpendView
    class << self
      def spend_category
        choices = {
          'a' => '食費',
          's' => '日用品',
          'd' => '趣味･娯楽',
          'f' => '交際費',
          'g' => '交通費',
          'h' => '被服費',
          'j' => '美容費',
          'k' => '健康･医療',
          'l' => '自動車',
          'z' => '教養･教育',
          'x' => '特別な支出',
          'c' => '光熱費',
          'v' => '通信費',
          'b' => '住宅',
          'n' => '税金･社会保険',
          'm' => '保険',
          ',' => 'その他',
          '.' => '未分類'
        }

        choice = select_menu(message: '項目を選択してください。', choices: choices)
        choices[choice]
      end

      def spend_price(spend)
        loop do
          y = CURSES_Y_INITIAL
          x = CURSES_X_INITIAL
          Curses.setpos(y, x)
          View.color_message(message: '金額を入力してください。', color: CURSES_COLOR_GREEN)
          Curses.refresh
          Curses.setpos(y += 1, x)
          spend.price = Curses.getstr
          Curses.clear
          break spend.price if spend.input_price_validate

          View.color_message(message: '金額は1から999,999,999までの数字を入力する必要があります。', color: CURSES_COLOR_RED,
                             y_coordinate: CURSES_Y_INITIAL - 1, x_coordinate: CURSES_X_INITIAL)
        end
      end
    end
  end
end
