# Description:
#	References to World of Warcraft.
#
# Commands:
#	Thunderfury, Blessed Blade of the Windseeker - Image of Thunderfury shows up.
#
# Notes:
#	Add a fuck ton of these lol.

module.exports = (robot) ->
  thunderfury = ['http://i1021.photobucket.com/albums/af332/Alkariender/MMOs/ThunderfuryBlessedBladeoftheWindseeker.png',
                 'http://static.fjcdn.com/comments/Thunderfury+blessed+blade+of+the+windseeker+_51af7964109a8750d1e3cbaa608292f6.png',
                 'http://www.shatteredstar.org/groups/wow/images/thunderfury.jpg'
                ]

  robot.hear /Thunderfury, Blessed Blade of the Windseeker/i, (res) ->
    res.send res.random thunderfury 
