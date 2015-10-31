# Description:
#   Age Sage! Age Sage!

cron = require('cron').CronJob
random = require('hubot').Response::random

bully_say = [
  '手を羽根のように広げて上げ下げ上げ下げ！三角筋に効くんだ！',
  'このくらいで音を上げてんじゃ、『へたれ』って呼んでやるぜぇ～',
  'んぅ～ビクトリア～ン！',
  'もも上げだぁ！唐揚げじゃないぞ！『もも上げ』だ！',
  'それしか上がらないのか。ナメクジだってもっと上がるぞ！',
  '次は腹筋だ！おヘソを意識して！シーソーのように…人生はシーソーゲームだ！',
  'それしか落とせないのか。昨日、かあちゃんにおしりぺんぺんされて、痛くて落とせないのか',
  '最後はクールダウン…ジュディ・オングのように…優雅に～',
  'みんな、よくやった！ビートキャンプは！俺たちのキズナだぁ！！！',
]

module.exports = (robot) ->
  new cron '0 0 21 * * *', () ->

    today = new Date()
    day = today.getDate()

    if day % 3 != 0 and day != 31
      user = {room: '#general'}
      imageMe robot, 'ブリー隊長', (url) ->
        robot.send user, url
  , null, true, "Asia/Tokyo"

imageMe = (robot, query, callback) ->
  q = v: '1.0', rsz: '8', q: query, safe: 'active'
  robot.http('http://ajax.googleapis.com/ajax/services/search/images')
    .query(q)
    .get() (err, res, body) ->
      images = JSON.parse(body)
      images = images.responseData?.results
      if images?.length > 0
        word = random bully_say
        image = random images
        url = ensureImageExtension image.unescapedUrl
        callback word + '\r\n' + url

ensureImageExtension = (url) ->
  ext = url.split('.').pop()
  if /(png|jpe?g|gif)/i.test(ext)
    url
  else
    "#{url}#.png"
