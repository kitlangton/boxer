# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  section = $(".container")
  boxes = new Boxes(section)

  $("#add-a-box").click ->
    userheight = $("#height-input").val()
    userwidth = $("#width-input").val()
    boxes.addBox(userheight,userwidth)

  $("#change-the-size").click ->
    boxes.stackBoxes()
