# Description:
# 	Jeeves responses for various easter eggs and inside jokes. 
#
# Notes:
#	These are easter eggs specific to the GroupMe chat "Nostalgia"

module.exports = (robot) ->
	robot.hear /For Dillon!/i, (res) -> 
		res.send "FOR DILLON!!! http://iruntheinternet.com/lulzdump/images/gifs/brave-ant-attacking-spider-jumping-13804816675.gif" 
