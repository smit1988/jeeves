# Description:
#   Track arbitrary karma
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   <thing>++ - give thing some karma
#   <thing>-- - take away some of thing's karma
#   hubot karma <thing> - check thing's karma (if <thing> is omitted, show the top 5)
#   hubot karma empty <thing> - empty a thing's karma
#   hubot karma best [n] - show the top n (default: 5)
#   hubot karma worst [n] - show the bottom n (default: 5)
#
# Contributors:
#   D. Stuart Freeman (@stuartf) https://github.com/stuartf
#   Andy Beger (@abeger) https://github.com/abeger
#
# Edited:
#   joncatanio

class Karma

  constructor: (@robot) ->
    @cache = {}

    @increment_responses = [
      "+1!", 
      "gained a level!", 
      "is a boss!", 
      "is going to the top!",
      "found a green mushroom!"
    ]

    @decrement_responses = [
      "took a hit! *chirps*.", 
      "took a dive.", 
      "lost a life.", 
      "lost a level.",
      "got owned", 
      "got slapped on the hand"
    ]

    @robot.brain.on 'loaded', =>
      if @robot.brain.data.karma
        @cache = @robot.brain.data.karma

  kill: (thing) ->
    delete @cache[thing]
    @robot.brain.data.karma = @cache

  increment: (thing) ->
    @cache[thing] ?= 0
    @cache[thing] += 1
    @robot.brain.data.karma = @cache

  decrement: (thing) ->
    @cache[thing] ?= 0
    @cache[thing] -= 1
    @robot.brain.data.karma = @cache

  incrementResponse: ->
     @increment_responses[Math.floor(Math.random() * @increment_responses.length)]

  decrementResponse: ->
     @decrement_responses[Math.floor(Math.random() * @decrement_responses.length)]

  get: (thing) ->
    k = if @cache[thing] then @cache[thing] else 0
    return k

  sort: ->
    s = []
    for key, val of @cache
      s.push({ name: key, karma: val })
    s.sort (a, b) -> b.karma - a.karma

  top: (n = 5) =>
    sorted = @sort()
    sorted.slice(0, n)

  bottom: (n = 5) =>
    sorted = @sort()
    sorted.slice(-n).reverse()

class User
  constructor: (username, nickname, userId) ->
    @username = username
    @nickname = nickname
    @userId = userId

module.exports = (robot) ->
  karma = new Karma robot

  #robot.hear /GroupMe: (.*) changed name to (.*)/i, (msg) ->
  #  users = robot.brain.users()
  #  console.log users

  ###
  # Listen for "++" messages and increment
  ###
  robot.hear /@?(\S+[^+\s])\+\+(\s|$)/, (msg) ->
    subject = msg.match[1].toLowerCase()

    # TESTING
    allUsers = []
    returnedUsers = robot.brain.users()
    console.log returnedUsers
    #console.log msg.message.user.user_id
    #console.log new User 'jonathan', 'peeop', 123
    console.log "For loop beginning" 
    for user in returnedUsers
      console.log user
      #console.log "Object Properties: " + user.name + ", " + user.nickname + ", " + user_id
      #allUsers.push new User user.name, user.nickname, user_id
    
    #console.log allUsers
    # TESTING

    karma.increment subject
    msg.send "#{subject} #{karma.incrementResponse()} (Karma: #{karma.get(subject)})"

  ###
  # Listen for "--" messages and decrement
  ###
  robot.hear /@?(\S+[^-\s])--(\s|$)/, (msg) ->
    subject = msg.match[1].toLowerCase()
    users = robot.brain.users()
    console.log users

    # avoid catching HTML comments
    unless subject[-2..] == "<!"
      karma.decrement subject
      msg.send "#{subject} #{karma.decrementResponse()} (Karma: #{karma.get(subject)})"

  ###
  # Listen for "karma empty x" and empty x's karma
  ###
  #robot.respond /karma empty ?(\S+[^-\s])$/i, (msg) ->
  #  subject = msg.match[1].toLowerCase()
  #  karma.kill subject
  #  msg.send "#{subject} has had its karma scattered to the winds."

  ###
  # Function that handles best and worst list
  # @param msg The message to be parsed
  # @param title The title of the list to be returned
  # @param rankingFunction The function to call to get the ranking list
  ###
  parseListMessage = (msg, title, rankingFunction) ->
    count = if msg.match.length > 1 then msg.match[1] else null
    verbiage = [title]
    if count?
      verbiage[0] = verbiage[0].concat(" ", count.toString())
    for item, rank in rankingFunction(count)
      verbiage.push "#{rank + 1}. #{item.name} - #{item.karma}"
    msg.send verbiage.join("\n")

  ###
  # Listen for "karma best [n]" and return the top n rankings
  ###
  robot.respond /karma best\s*(\d+)?$/i, (msg) ->
    parseData = parseListMessage(msg, "The Best", karma.top)

  ###
  # Listen for "karma worst [n]" and return the bottom n rankings
  ###
  robot.respond /karma worst\s*(\d+)?$/i, (msg) ->
    parseData = parseListMessage(msg, "The Worst", karma.bottom)

  ###
  # Listen for "karma x" and return karma for x
  ###
  robot.respond /karma (\S+[^-\s])$/i, (msg) ->
    match = msg.match[1].toLowerCase()
    if not (match in ["best", "worst"])
      msg.send "\"#{match}\" has #{karma.get(match)} karma."

