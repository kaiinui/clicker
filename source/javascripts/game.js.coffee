enchant()

game = new Core(640, 640)
game.preload("images/chara1.png")
game.fps = 30

game.onload = ->
  scene = game.rootScene

  scene.on 'touchmove', (e)->
    addBear(e.localX, e.localY)

game.start()

addBear = (x, y)->
  bear = new Sprite(32, 32)
  bear.x = x
  bear.y = y
  bear.image = game.assets["images/chara1.png"]
  amountX = rand(-100, 100)
  amountY = rand(-100, 100)
  bear.tl.moveBy(amountX, amountY, 90)
    .moveBy(-amountX, -amountY, 90)
    .loop()
  game.rootScene.addChild(bear)
  bear.frame = [6,6,7,7]

rand = (min, max)->
  Math.floor(Math.random() * (max - min)) + min