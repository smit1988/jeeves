#!/bin/bash
echo Deploying to all heroku apps...

# Nostalgia
echo
echo Deploying Nostalgia...
echo
git push heroku master
echo
echo Nostalgia deploy complete.
echo 

# The Jedi Council
echo
echo Deploying The Jedi Council...
echo
git push jeeves-chatbot-2 master
echo
echo The Jedi Council deploy complete.
echo

# Jeeves Test Group
echo
echo Deploying Jeeves Test Group
echo
git push jeeves-chatbot-testing master
echo
echo Jeeves Test Group deploy complete.
echo All app deploy complete.
