class @Box
  constructor: (@height, @width) ->

  createBox: (section) ->
    @self = $(".hidden .box").clone().appendTo(section).css(
      position: "absolute"
      top: 10
      height: @height
      width: @width
      display: "none"
    )
    @self.velocity "transition.slideUpIn"


  resize: (height,width) ->
    @height = height
    @width = width
    @self.velocity {
      height: @height
      width: @width
    }

  left_position: (new_left) ->
    @self.css
      position: "absolute",
      left: new_left

  right: ->
    width = @self.width()
    @self.position().left + width
  left: ->
    width = @self.width()
    @self.position().left + 1
  top: ->
    @self.position().top
  width: ->
    @self.width()

  stackOn: (otherBox, distance) ->
    x = otherBox.left() - @.left() + distance
    y = otherBox.top() - @.top() + distance
    @self.velocity 
      translateX: x
      translateY: y


class @Boxes
  constructor: (@section) ->
    @boxes = []
    @stacked_boxes = []

  addBox: (height,width) ->
    box = new Box(height,width)
    box.createBox(@section)
    if @boxes.length > 0
      last_box = @boxes[@boxes.length - 1]
      console.log(last_box)
      new_left = last_box.right() + 10
      box.left_position(new_left)
    @boxes.push box

  stackBoxes: ->
    array = [1, 2, 3]
    @stacked_boxes.push @boxes
    to_move = @boxes
    @boxes = []
    for e, i in to_move by 3
      to_move[i+1].stackOn(e,10)
      to_move[i+2].stackOn(e,20)

class @Stack
  constructor: (@boxes) ->
