close_layover = ->
  console.log "clicked"
  $(".search").animate
    left: "25%"
  , 1000
  l = $(document).innerWidth() + "px"
  $(".results").animate
    left: l
  , 1000
  $(".search input").focus().select()
  return

update_cover = ->
  rand = Math.floor(Math.random() * (imgs.length - 20))
  rand2 = Math.floor(Math.random() * imgs.length)
  li_uid = imgs[rand].uid
  li_img = imgs[rand2].img
  img = new Image()
  img.src = li_img
  img.width = 200
  img.height = 200
  $("#" + li_uid + " img").animate
    opacity: 0
  , 0, ->
    $("#" + li_uid).html img
    $("#" + li_uid + " img").css "opacity", "0"
    $("#" + li_uid + " img").animate
      opacity: 1
    , 200
    return

  return

imgs = new Array()

tracks = [
  "spotify:album:35vsbOlLrYei0RPjCgy79r"
  "spotify:album:49FT1BTDipVvxOIQyyzWh5"
  "spotify:album:2wCCXYJUgeiRqyIr3ujbMF"
  "spotify:album:7issYZgXiFVrfI8ZnlslZt"
  "spotify:album:6VFEalcvsUGtbuWfU8rHyu"
  "spotify:album:1aXeyNdS966LC1RsfzTdaj"
  "spotify:album:3og5qaZmG4KHVyFyhxVJF2"
  "spotify:album:0Q8y8YvNgEtHo13D4juRvA"
  "spotify:album:0YEIhLHs5kP5CpU7HBBRL6"
  "spotify:album:0u34k1ANjgZ47uQfG9yaLj"
  "spotify:album:4TMFJM8OsgA2RwwYySNhmU"
  "spotify:album:1zIoYLpYOq8d4HFzHJ7vc8"
  "spotify:album:7bMpvjE9r9KDv2prNYaVpg"
  "spotify:album:0a5t6HeElUsxiFrdocSlBM"
  "spotify:album:40IZprv4dFVqmb1paBlcCi"
  "spotify:album:3JNIxit6lp40LOVmJS28Ph"
  "spotify:album:5G6pS4ES22Np0hehqJYIct"
  "spotify:album:7rgq4mAjZOPGVJCRF56FU4"
  "spotify:album:3OruSfm0NBmUPhwTafdktT"
  "spotify:album:0oW1XkgrsfYC3r4ukz3TLT"
  "spotify:album:7mEjsBlRmfP63cH1gdPT6A"
  "spotify:album:5LRs2eubUNkGtPAYcPfNji"
  "spotify:album:5pFyvgrdaeCRXbIDTI74Dr"
  "spotify:album:0rr668ZzoNDQa1yxhSpBAw"
  "spotify:album:7p6Nh183RUdsEM5wltdv9Q"
  "spotify:track:3D4QFgYa3P9P0gjmv4eX6I"
  "spotify:album:3v4JnHV14VstZfGKJ49bi9"
  "spotify:album:33p78EyTp6esCBodi24Pzx"
  "spotify:album:01g7zbuqO1zMa5F8Lsric1"
  "spotify:album:1x0uzT3ETlIYjPueTyNfnQ"
  "spotify:album:3a0UOgDWw2pTajw85QPMiz"
  "spotify:album:4Qgz29mI2wJFD1tbnXqj7V"
  "spotify:album:0GqpoHJREPp0iuXK3HzrHk"
  "spotify:album:1Ugdi2OTxKopVVqsprp5pb"
  "spotify:album:58MQ0PLijVHePUonQlK76Y"
  "spotify:album:1J8QW9qsMLx3staWaHpQmU"
  "spotify:album:7x0RvAniGO96QHx2JB5fqC"
  "spotify:album:1dAMOzVkl7m9heZl5SCiZF"
  "spotify:album:5OiUURWMLnRycOmHPUm5Wy"
  "spotify:album:43QrGfDuts6Pv3GYXXVt9I"
  "spotify:album:2WBQEn5OPnIvyy9I1Y2Ctj"
  "spotify:album:61MaC3q8WSkGdLQm4xQlyn"
  "spotify:album:2P3V9N2u2JNGDKXbDU0weF"
  "spotify:album:0daIqjuhsQqXoeII3pBSeT"
  "spotify:album:44U11B6kysBKC2vMom6lBh"
  "spotify:album:06WRscC6cLW7FOv9RwyFoB"
  "spotify:album:1xRg9g9QCGjFp9poxLnU5M"
  "spotify:album:6oRuinkJdTge4hpTuClEF8"
  "spotify:album:03vJ0BcslLb4fKyBYN78Gy"
  "spotify:album:3KVlwcVehr3KwAu0648Mg3"
  "spotify:album:6i97CIfeHYCaTFcTBn6gYK"
  "spotify:album:54DjkEN3wdCQgfCTZ9WjdB"
  "spotify:album:5FbrTPPlaNSOsChhKUZxcu"
  "spotify:album:3U1ht9EdWEI9nMvaqdQI67"
  "spotify:album:2tHDc9g2bu1rz62xIjX1GE"
  "spotify:album:1XsXHctYSQNyAd9BANCk2B"
  "spotify:album:4I81vwiu6AHCHx9Hf8MUOV"
  "spotify:album:6sFPINpji6nXBbbAjoAYiZ"
  "spotify:album:4M9gPAlAZrnDvuzw6iJseQ"
  "spotify:album:1RSO63oaHi6R2ZfBL5jF5i"
  "spotify:album:1JqPhlEsFuV0WsxezoVI8N"
]

put_albums = ->
  i = 0

  while i < 60
    $.ajax
      url: "https://embed.spotify.com/oembed/?url=" + tracks[i] + "&callback=callme"
      type: "GET"
      crossDomain: true
      dataType: "jsonp"

      success: (data) ->
        img = new Image()
        img.src = data.thumbnail_url
        img.width = 200
        img.height = 200
        randLetter = String.fromCharCode(65 + Math.floor(Math.random() * 26))
        uid = randLetter + Date.now()
        $(".background ul").append "<li id='" + uid + "'></li>"
        $(".background ul li:last-child").append img
        imgs.push
          img: img.src
          uid: uid
        return

      error: ->
        console.log "An Unkown error Occured Getting this Album Info"
        return

    i++

  setInterval update_cover, 500

  return

put_albums()