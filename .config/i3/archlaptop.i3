gaps inner 0
smart_borders on
exec_always --no-startup-id polybar
exec_always --no-startup-id conky
exec_always --no-startup-id picom -b
exec --no-startup-id kwalletd5
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock -c 039393 --radius 160 --ring-width 20 --pass-media-keys --clock --inside-color ffffff --nofork
