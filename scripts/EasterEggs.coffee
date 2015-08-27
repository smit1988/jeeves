# Description:
# 	Jeeves responses for various easter eggs and inside jokes. 
#
# Commands:
#	For Dillon!!! - Posts the ant jumping on spider gif and yells For Dillon!
# 	The real Hoose! - Posts the real Hoose, we know who you really are.
#	Great White Buffalo - Posts the gif from Hot Tub Time Machine.
#	Center for ants? - Posts the Zoolander center for ants gif. 
# 	Nostalgia - Posts the 7-26-10 LK kill that the group Nostalgia is named after.
#
# Notes:
#	These are easter eggs specific to the GroupMe chat "Nostalgia"

module.exports = (robot) ->
	robot.hear /For Dillon!/i, (res) -> 
		res.send "For Dillon!!!"
		res.send "http://iruntheinternet.com/lulzdump/images/gifs/brave-ant-attacking-spider-jumping-13804816675.gif" 

	robot.hear /The real Hoose!/i, (res) ->
		res.send "http://cs5.pikabu.ru/images/big_size_comm/2015-02_2/14235830609123.jpg" 

	robot.hear /Great White Buffalo/i, (res) ->
		res.send "https://i.imgur.com/2Y7NEq3.webm"

	robot.hear /Center for ants?/i, (res) ->
		res.send "https://38.media.tumblr.com/a5f174e7fa5da41a771f7f61470c6cc7/tumblr_mweix0ZXCn1qzee63o1_500.gif"

	robot.hear /Nostalgia/i, (res) ->
		res.send "http://i.imgur.com/siEhUc5.jpg" 
