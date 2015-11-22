# Description:
#   Generates memes via the Imgflip Meme Generator API
#
# Dependencies:
#   None
#
# Configuration:
#   IMGFLIP_API_USERNAME [optional, overrides default imgflip_hubot account]
#   IMGFLIP_API_PASSWORD [optional, overrides default imgflip_hubot account]
#
# Commands:
#   /One does not simply <text> - Lord of the Rings Boromir
#   /I don't always <text> but when i do <text> - The Most Interesting man in the World
#   /aliens <text> - Ancient Aliens History Channel Guy
#   /grumpy cat <text> - Grumpy Cat with text on the bottom
#   /<text>, <text> everywhere - X, X Everywhere (Buzz and Woody from Toy Story)
#   /Not sure if <text> or <text> - Futurama Fry
#   /Y U NO <text> - Y U NO Guy
#   /Brace yourselves <text> - Brace Yourselves X is Coming (Imminent Ned, Game of Thrones)
#   /<text> all the <text> - X all the Y
#   /<text> that would be great - Bill Lumbergh from Office Space
#   /<text> too damn <text> - The rent is too damn high
#   /Yo dawg <text> so <text> - Yo Dawg Heard You (Xzibit)
#   /<text> you're gonna have a bad time - Super Cool Ski Instructor from South Park
#   /Am I the only one around here <text> - The Big Lebowski
#   /What if I told you <text> - Matrix Morpheus
#   /<text> ain't nobody got time for that
#   /<text> I guarantee it - George Zimmer
#   /<text> and it's gone - South Park Banker Guy
#   /<text> nobody bats an eye <text> everyone loses their minds - Heath Ledger Joker
#   /back in my day <text> - Grumpy old man 
#   /maury lie detector: <top>, <bottom> - Maury lie detector
#
# Author:
#   dylanwenzlau
#
# Appended:
#   joncatanio

inspect = require('util').inspect

module.exports = (robot) ->
  unless robot.brain.data.imgflip_memes?
    robot.brain.data.imgflip_memes = [
      {
        regex: /(one does not simply) (.*)/i,
        template_id: 61579
      },
      {
        regex: /(i don'?t always .*) (but when i do,? .*)/i,
        template_id: 61532
      },
      {
        regex: /aliens ()(.*)/i,
        template_id: 101470
      },
      {
        regex: /grumpy cat ()(.*)/i,
        template_id: 405658
      },
      {
        regex: /(.*),? (\1 everywhere)/i,
        template_id: 347390
      },
      {
        regex: /(not sure if .*) (or .*)/i,
        template_id: 61520
      },
      {
        regex: /(y u no) (.+)/i,
        template_id: 61527
      },
      {
        regex: /(brace yoursel[^\s]+) (.*)/i,
        template_id: 61546
      },
      {
        regex: /(.*) (all the .*)/i,
        template_id: 61533
      },
      {
        regex: /(.*) (that would be great|that'?d be great)/i,
        template_id: 563423
      },
      {
        regex: /(.*) (\w+\stoo damn .*)/i,
        template_id: 61580
      },
      {
        regex: /(yo dawg .*) (so .*)/i,
        template_id: 101716
      },
      {
        regex: /(.*) (.* gonna have a bad time)/i,
        template_id: 100951
      },
      {
        regex: /(am i the only one around here) (.*)/i,
        template_id: 259680
      },
      {
        regex: /(what if i told you) (.*)/i,
        template_id: 100947
      },
      {
        regex: /(.*) (ain'?t nobody got time for? that)/i,
        template_id: 442575
      },
      {
        regex: /(.*) (i guarantee it)/i,
        template_id: 10672255
      },
      {
        regex: /(.*) (a+n+d+ it'?s gone)/i,
        template_id: 766986
      },
      {
        regex: /(.* bats an eye) (.* loses their minds?)/i,
        template_id: 1790995
      },
      {
        regex: /(back in my day) (.*)/i,
        template_id: 718432
      },
      {
        regex: /maury lie detector:? (.*), (.*)/i,
        template_id: 444501
      },
      {
        regex: /awkward seal:? (.*), (.*)/i,
        template_id: 13757816
      }
    ]

  for meme in robot.brain.data.imgflip_memes
    setupResponder robot, meme

setupResponder = (robot, meme) ->
  robot.respond meme.regex, (msg) ->
    generateMeme msg, meme.template_id, msg.match[1], msg.match[2]

generateMeme = (msg, template_id, text0, text1) ->
  username = process.env.IMGFLIP_API_USERNAME
  password = process.env.IMGFLIP_API_PASSWORD

  if (username or password) and not (username and password)
    msg.reply 'To use your own Imgflip account, you need to specify username and password!'
    return

  if not username
    username = 'imgflip_hubot'
    password = 'imgflip_hubot'

  msg.http('https://api.imgflip.com/caption_image')
  .query
      template_id: template_id,
      username: username,
      password: password,
      text0: text0,
      text1: text1
  .post() (error, res, body) ->
    if error
      msg.reply "I got an error when talking to imgflip:", inspect(error)
      return

    result = JSON.parse(body)
    success = result.success
    errorMessage = result.error_message

    if not success
      msg.reply "Imgflip API request failed: #{errorMessage}"
      return

    msg.send result.data.url
