# Description:
# 	Jeeves responses for various easter eggs and inside jokes. 
#
# Commands:
#	For Dillon!!! - Posts the ant jumping on spider gif and yells For Dillon!
# 	The real Hoose! - Posts the real Hoose, we know who you really are.
#	Great White Buffalo - Posts the gif from Hot Tub Time Machine.
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
