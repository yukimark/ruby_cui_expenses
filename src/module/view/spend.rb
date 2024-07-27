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

        choice = select_menu(message: '項目を選択してください。', choices:)
        choices[choice]
      end

      def spend_price(spend)
        loop do
          y = CURSES_Y_INITIAL
          x = CURSES_X_INITIAL
          Curses.setpos(y, x)
          View.color_message(message: '金額を入力してください。', color: CURSES_COLOR_GREEN)
          Curses.refresh
          Curses.setpos(y + 1, x)
          spend.price = Curses.getstr
          Curses.clear
          break spend.price if spend.input_price_validate

          View.error_message('金額は1から999,999,999までの数字を入力する必要があります。')
        end
      end

      def sum_spend_price(sum_price)
        y = CURSES_Y_INITIAL
        x = CURSES_X_INITIAL
        Curses.setpos(y, x)
        Curses.addstr("これまでのお小遣い帳合計額は、#{sum_price}円です。")
        Curses.setpos(y += 2, x)
        Curses.addstr('任意のキー入力でトップ画面に戻ります。')
        Curses.refresh
        Curses.setpos(y + 1, x)
        Curses.getch
        Curses.clear
      end

      def delete_spend_menu
        choices = {
          'a' => '直前の1件を削除',
          's' => 'IDを指定して削除'
        }

        select_menu(message: I18n.t('menu.select'), choices:)
      end

      def spend_find_id
        loop do
          y = CURSES_Y_INITIAL
          x = CURSES_X_INITIAL
          Curses.setpos(y, x)
          View.color_message(message: 'IDを入力してください。', color: CURSES_COLOR_GREEN)
          Curses.refresh
          Curses.setpos(y + 1, x)
          id = Curses.getstr
          Curses.clear
          break id if number?(id)

          View.error_message('数字を入力してください。')
        end
      end
    end
  end
end

private

def number?(str)
  str =~ /\A[0-9]+\z/
end
