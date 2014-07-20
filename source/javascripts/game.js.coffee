enchant()

count = 0

game = new Core(640, 640)
game.preload("images/mouse.png")
game.fps = 30

game.onload = ->
  scene = game.rootScene
  text = new Label(1)
  text.font = "40px cursive"
  scene.addChild(text)

  scene.on 'touchmove', (e)->
    addBear(e.localX, e.localY)
    count += 1
    text.text = count

game.start()

addBear = (x, y)->
  bear = new Sprite(48, 48)
  bear.x = x
  bear.y = y
  bear.image = game.assets["images/mouse.png"]
  amountX = rand(-100, 100)
  amountY = rand(-100, 100)
  if amountX > 0
    bear.tl.scaleTo(-1, 1, 0)
  bear.tl.moveBy(amountX, amountY, 90)
    .scaleTo(-1, 1, 10)
    .moveBy(-amountX, -amountY, 90)
    .scaleTo(-1, 1, 10)
    .loop()
  game.rootScene.addChild(bear)
  bear.frame = [6,6,7,7]

rand = (min, max)->
  Math.floor(Math.random() * (max - min)) + min