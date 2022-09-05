#! /bin/bash

# Read variables from config file
source <(grep = /home/enstit/scripts/udine_wastecollection_reminder/config.ini)

# Get the current day of week in locale’s full weekday name (e.g. "Monday")
DAY_OF_WEEK=$(date --date="tomorrow" +%A)

curl -s \
  --data "text=♻️ Remember to bring out the *${!DAY_OF_WEEK,,} bin* for the collection!" \
  --data "chat_id=${GROUP_ID}" \
  --data-urlencode "parse_mode=markdown" \
  'https://api.telegram.org/bot'${BOT_TOKEN}'/sendMessage' >> /tmp/udine_wastecollection_reminder.log
