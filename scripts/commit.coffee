# prints a random commit message from whatthecommit.com
#
# Commands:
#   hubot commit - looks for a random cat on procatinator.
#
cheerio = require('cheerio')

module.exports = (robot) ->
  robot.respond /(commit)/i, (msg) ->
    msg.http('http://whatthecommit.com')
      .get() (err, res, body) ->
        $ = cheerio.load(body)
        msg.send( $('#content p').first().text().trim() )
