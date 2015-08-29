# Description:
# 	Jeeves responses for various easter eggs and inside jokes. 
#
# Commands:
#	For Dillon!!! - Posts the ant jumping on spider gif and yells For Dillon!
# 	The real Hoose! - Posts the real Hoose, we know who you really are.
#	Mexican Hoose - Posts the real Hoose as a Mexican drug lord.
# 	Nostalgia - Posts the 7-26-10 LK kill that the group Nostalgia is named after.
#  Where is Cody? - Tries to find our pal Cody Skrabo.
#  Meegan you left your jacket! - Meegan appears, just give up on her already!
#
# Notes:
#	These are easter eggs specific to the GroupMe chat "Nostalgia"

module.exports = (robot) ->
	robot.hear /For Dillon!/i, (res) -> 
		res.send "For Dillon!!!"
		res.send "http://iruntheinternet.com/lulzdump/images/gifs/brave-ant-attacking-spider-jumping-13804816675.gif" 

	robot.hear /The real Hoose!/i, (res) ->
		res.send "http://cs5.pikabu.ru/images/big_size_comm/2015-02_2/14235830609123.jpg" 

	robot.hear /Mexican Hoose/i, (res) ->
		res.send "http://i.imgur.com/MjUjqz7.jpg"

	robot.hear /Nostalgia/i, (res) ->
		res.send "http://i.imgur.com/siEhUc5.jpg" 

	robot.hear /Where is Cody?/i, (res) ->
		res.send "http://9.mshcdn.com/wp-content/gallery/entertaining-404-error-pages/chrisjennings.jpg#.png"

	meegan = ["https://media4.giphy.com/media/us72CO9KatWAE/200.gif",
				 "https://media.giphy.com/media/4tIcgqABXEsnK/giphy.gif"
				]
	robot.hear /Meegan you left your jacket!/i, (res) ->
		res.send res.random meegan

	robot.hear /Boom Boom Pow/i, (res) ->
		res.send "https://33.media.tumblr.com/17c4b0c1c8b73c764015facb2c3346d5/tumblr_mtfyv5XMVl1qd8zg3o7_250.gif"

# Hidden Easter Eggs.
	robot.hear /fuck you Jeeves/i, (res) ->
		res.send "Fuck you too pussy"
