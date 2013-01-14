# Messing around with procatinator.com.
#
# Commands:
#   hubot procat - looks for a random cat on procatinator.
module.exports = (robot) ->
  robot.respond /(procat|pc)/i, (msg) ->
    catId = Math.floor(Math.random() * 201)
    msg.send "http://procatinator.com/?cat=" + catId
