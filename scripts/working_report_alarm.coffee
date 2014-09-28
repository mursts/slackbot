# Description:
#   Working Report alerm

cron = require('cron').CronJob

module.exports = (robot) ->
  new cron '0 0 10,20 * * *', () ->
    user = {room: '#general'}
    message = '勤怠の提出日です'
    robot.send user, message
  , null, true, "Asia/Tokyo"
