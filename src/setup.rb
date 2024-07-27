require_relative 'module/db'
require 'i18n'
require 'pry'
require 'curses'

CURSES_COLOR_RED = 1
CURSES_COLOR_GREEN = 2
CURSES_COLOR_YELLOW = 3
CURSES_Y_INITIAL = 2
CURSES_X_INITIAL = 4

def setup
  DB.connect
  i18n_init
  curses_init
end

private

def i18n_init
  I18n.load_path = ['config/locales/ja.yml']
  I18n.locale = :ja
end

def curses_init
  Curses.init_screen
  Curses.start_color
  Curses.init_pair(CURSES_COLOR_RED, Curses::COLOR_RED, Curses::COLOR_BLACK)
  Curses.init_pair(CURSES_COLOR_GREEN, Curses::COLOR_GREEN, Curses::COLOR_BLACK)
  Curses.init_pair(CURSES_COLOR_YELLOW, Curses::COLOR_YELLOW, Curses::COLOR_BLACK)
end
