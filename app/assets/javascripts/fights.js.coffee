# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

showscore = ->
  if $('#winlose').html() != null
    $('.score.player').removeClass('hidden')
    $('.weapon.player').attr('src', $('.player.weapon.cache').attr('src'))

showwinner = ->
  if $('#winlose').html() != null
    unless $('.winlose.graphic').data("status") == ""
      $('#winlose').slideDown();

redirectpage = ->
  if $('#winlose').html() != null
   window.location = "http://buttongluttons.com/leaderboard"
   return false

setTimeout showscore, 3000
setTimeout showwinner, 3500
setTimeout redirectpage, 6000