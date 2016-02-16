# Description:
# 	Jeeves responses for Nostalgia inside jokes. 
#
# Commands:
#	For Dillon!!! - Posts the ant jumping on spider gif and yells For Dillon!
#  The real Dave! - Posts the real Dave. 
# 	Nostalgia - Posts the 7-26-10 LK kill that the group Nostalgia is named after.
#  Where is Cody? - Tries to find our pal Cody Skrabo.
#	The van - Links the majestic Aerostar van
#	Massive camel attack gotta go! - Camels are coming!
#	Cheese wheel - World's largest cheese wheel
#  Starfish dive - Ohh Patrick
#	Carrots in the pasta - Come on Hoose...
#
# Enable/Disable:
#  ENABLE NOSTALGIA INSIDE JOKES - Enables all Nostalgia inside jokes.
#  DISABLE NOSTALGIA INSIDE JOKES - Disables all Nostalgia inside jokes.
#
# Group:
#	Nostalgia	

module.exports = (robot) ->
   robot.hear /For Dillon!/i, (res) ->
      if robot.brain.data.nostalgiaInsideJokes
         res.send "For Dillon!!!"
         res.send "http://iruntheinternet.com/lulzdump/images/gifs/brave-ant-attacking-spider-jumping-13804816675.gif"

   robot.hear /The real Dave!/i, (res) ->
      if robot.brain.data.nostalgiaInsideJokes
         res.send "http://40.media.tumblr.com/tumblr_maobzym6gi1r8269to1_500.jpg"
	
   robot.hear /Nostalgia/i, (res) ->
      if robot.brain.data.nostalgiaInsideJokes
         res.send "http://i.imgur.com/siEhUc5.jpg"

   robot.hear /Where is Cody?/i, (res) ->
      if robot.brain.data.nostalgiaInsideJokes
         res.send "http://9.mshcdn.com/wp-content/gallery/entertaining-404-error-pages/chrisjennings.jpg#.png"

   robot.hear /the van/i, (res) ->
      if robot.brain.data.nostalgiaInsideJokes
         res.send "http://imgur.com/CK6dKDW"

   camels = [
      "http://farm8.static.flickr.com/7460/11131280124_e5e2cb5c2e.jpg",
      "http://www.cowart.info/images/clip_image006.jpg",
      "http://ichef.bbci.co.uk/news/1024/media/images/67646000/jpg/_67646477_camel_thinkstock.jpg"
   ]
   robot.hear /(oh shit)?(, )?massive camel attack got(ta| to) go\!*/i, (res) ->
      if robot.brain.data.nostalgiaInsideJokes
         res.send res.random camels

   robot.hear /cheese wheel/i, (res) ->
      if robot.brain.data.nostalgiaInsideJokes
         res.send "http://www.seriouseats.com/images/worldslargestwheelofcheese.jpg"

   starfish = [
      "https://i.groupme.com/1080x805.png.753cc4670f0b46b981a1b159db289a52.large",
      "http://imgur.com/xdQMuvv"
   ]
   robot.hear /starfish dive/i, (res) ->
      if robot.brain.data.nostalgiaInsideJokes
         res.send res.random starfish

   robot.hear /carrots in the pasta/i, (res) ->
      if robot.brain.data.nostalgiaInsideJokes
         res.send "http://itsybitsyfoodies.com/wp-content/uploads/2010/01/IMG_3397.jpg"

   robot.respond /ENABLE NOSTALGIA INSIDE JOKES/, (res) ->
      robot.brain.data.nostalgiaInsideJokes ?= {}
      robot.brain.data.nostalgiaInsideJokes = true
      res.send "Nostalgia inside jokes enabled"

   robot.respond /DISABLE NOSTALGIA INSIDE JOKES/, (res) ->
      robot.brain.data.nostalgiaInsideJokes ?= {}
      robot.brain.data.nostalgiaInsideJokes = false
      res.send "Nostalgia inside jokes disabled"
