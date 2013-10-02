# Description:
#   Show current status of Bede services 
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot bede status - Returns the current status of Bede services.
#
# Author:
#   shapeshed

module.exports = (robot) ->
  robot.respond /bede status$/i, (msg) ->
    dev01engine msg
    dev01enginev3 msg
    dev01chat msg
    dev01chatv2 msg
    qa01engine msg
    qa01chat msg

# NOTE: messages contains new lines for some reason.
formatString = (string) ->
  decodeURIComponent(string.replace(/(\n)/gm," "))

dev01engine = (msg) ->
  msg.http('https://dev01-bingostars.bedegaming.net/2226/reg/0/0?Token=0')
    .headers("x-api-version": 2.1, Accept: 'application/json')
    .post() (err, res, body) ->
      if err
        out = err
      if res.statusCode == 200
        out = 'OK'
      else
        out = "NOT OK"
        reason = if err then err else res.statusCode
        out = "#{out} #{reason}"

      msg.send "[DEV01] Bingo Engine #{out}"

dev01enginev3 = (msg) ->
  msg.http('http://a1-dv01-bng-02.cloudapp.net/signalr/negotiate')
    .get() (err, res, body) ->
      if err
        out = err
      if res.statusCode == 200
        out = 'OK'
      else
        out = "NOT OK"
        reason = if err then err else res.statusCode
        out = "#{out} #{reason}"

      msg.send "[DEV01] Bingo Engine V3 #{out}"

dev01chat = (msg) ->
  msg.http('https://dev01-bingostars.bedegaming.net/socket.io/')
    .get() (err, res, body) ->
      if err
        out = err
      if res.statusCode == 200
        out = 'OK'
      else
        out = "NOT OK"
        reason = if err then err else res.statusCode
        out = "#{out} #{reason}"

      msg.send "[DEV01] Chat Server #{out}"

dev01chatv2 = (msg) ->
  msg.http('https://dev01-bingostars.bedegaming.net/engine.io/?EIO=2&transport=polling')
    .get() (err, res, body) ->
      if err
        out = err
      if res.statusCode == 200
        out = 'OK'
      else
        out = "NOT OK"
        reason = if err then err else res.statusCode
        out = "#{out} #{reason}"

      msg.send "[DEV01] Chat Server V2 #{out}"

qa01engine = (msg) ->
  msg.http('https://qa01-bingostars.bedegaming.net/2226/reg/0/0?Token=0')
    .headers("x-api-version": 2.1, Accept: 'application/json')
    .post() (err, res, body) ->
      if err
        out = err
      if res.statusCode == 200
        out = 'OK'
      else
        out = "NOT OK"
        reason = if err then err else res.statusCode
        out = "#{out} #{reason}"

      msg.send "[QA01] Bingo Engine #{out}"

qa01chat = (msg) ->
  msg.http('https://qa01-bingostars.bedegaming.net/socket.io/')
    .get() (err, res, body) ->
      if err
        out = err
      if res.statusCode == 200
        out = 'OK'
      else
        out = "NOT OK"
        reason = if err then err else res.statusCode
        out = "#{out} #{reason}"

      msg.send "[QA01] Chat Server #{out}"
