# wallbook
Files for creating an wall info display and script to make the system wake/sleep

add something like the following with "sudo crontab -e" for automated sleep/startup to the cron table:

00 0  * * 1-5 /home/kryptokommunist/Desktop/wallbook/suspend_until 8:00
00 10 * * 1-5 /home/kryptokommunist/Desktop/wallbook/suspend_until 18:00
00 0  * * 6,7 /home/kryptokommunist/Desktop/wallbook/suspend_until 10:00
00 10 * * 6,7 /home/kryptokommunist/Desktop/wallbook/suspend_until 18:00

add something like the following with "crontab -e" for intializing the display script with startup:

@reboot ruby /home/kryptokommunist/Desktop/wallbook/hawttrends.rb
