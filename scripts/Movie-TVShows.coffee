# Description:
#	Responses for Movie and TV Show keywords.
#
# Commands:
#  Great White Buffalo - Posts the gif from Hot Tub Time Machine.
#  Center for ants? - Posts the Zoolander center for ants gif. 

module.exports = (robot) ->
  robot.hear /Great White Buffalo/i, (res) ->
    res.send "https://i.imgur.com/2Y7NEq3.webm"

  robot.hear /Center for ants?/i, (res) ->
    res.send "https://38.media.tumblr.com/a5f174e7fa5da41a771f7f61470c6cc7/tumblr_mweix0ZXCn1qzee63o1_500.gif"
