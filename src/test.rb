require 'curses'
require 'pry'

Curses.init_screen
begin
  s = 'Hello World!'
  Curses.setpos(Curses.lines / 2, Curses.cols / 2 - (s.length / 2))
  Curses.addstr(s)
  Curses.refresh
  Curses.getstr
ensure
  Curses.close_screen
end

Curses.init_screen
begin
  s = 'うんこ!'
  Curses.setpos(Curses.lines / 2, Curses.cols / 2 - (s.length / 2))
  Curses.addstr(s)
  Curses.refresh
  Curses.getstr
ensure
  Curses.close_screen
end
