# Description:
#	These are responses to peoples names in chat.
#
# Notes:
# 	These apply to specific people.	

module.exports = (robot) ->
	robot.hear /hoose/i, (res) ->
		res.send "http://cs5.pikabu.ru/images/big_size_comm/2015-02_2/14235830609123.jpg" 
