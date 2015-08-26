# Description:
# 	Jeeves responses for various easter eggs and inside jokes. 
#
# Notes:
#	These are easter eggs specific to the GroupMe chat "Nostalgia"

module.exports = (robot) ->
	robot.hear /For Dillon!/i, (res) -> 
		res.send "For Dillon!!!"
		res.send "http://iruntheinternet.com/lulzdump/images/gifs/brave-ant-attacking-spider-jumping-13804816675.gif" 

module.exports = (robot) ->
   robot.hear /The real Hoose!/i, (res) ->
      res.send "http://cs5.pikabu.ru/images/big_size_comm/2015-02_2/14235830609123.jpg" 
