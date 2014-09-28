# Description:
#   Working Report alerm

cron = require('cron').CronJob

module.exports = (robot) ->
  #new cron '0 0 9,20 15 * *', () ->
  new cron '0/30 * 13 * * *', () ->
    user = {room: '#general'}
    message = '勤怠の提出日です'
    robot.send user, message
  , null, true, "Asia/Tokyo"
