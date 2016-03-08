#!/bin/bash
APP=""
VAR_CONFIG_COMMAND="heroku config:set --app "

echo Creating $APP
heroku create $APP
echo Current application: $APP

$VAR_CONFIG_COMMAND $APP HUBOT_ADAPTER=groupme
$VAR_CONFIG_COMMAND $APP HUBOT_ALIAS=/jeeves
$VAR_CONFIG_COMMAND $APP HUBOT_GROUPME_BOT_ID=789452c532954beda27e9f2998
$VAR_CONFIG_COMMAND $APP HUBOT_GROUPME_ROOM_ID=20281389
$VAR_CONFIG_COMMAND $APP HUBOT_GROUPME_TOKEN=dHSHK82NfSKqBiCzKdbncyteIw2GeCZ8tsEJ1QXz
$VAR_CONFIG_COMMAND $APP HUBOT_HEROKU_KEEPALIVE_URL=
$VAR_CONFIG_COMMAND $APP HUBOT_HEROKU_SLEEP_TIME=24:00
$VAR_CONFIG_COMMAND $APP HUBOT_HEROKU_WAKEUP_TIME=6:00
$VAR_CONFIG_COMMAND $APP HUBOT_YOUTUBE_API_KEY=
$VAR_CONFIG_COMMAND $APP HUBOT_YOUTUBE_DETERMINISTIC_RESULTS=true
$VAR_CONFIG_COMMAND $APP TZ=America/Los_Angeles
$VAR_CONFIG_COMMAND $APP HUBOT_GOOGLE_CSE_ID=
$VAR_CONFIG_COMMAND $APP HUBOT_GOOGLE_CSE_KEY=
