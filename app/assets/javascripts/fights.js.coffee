# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

showscore = () ->
  $('.score.player').removeClass('hidden')
  $('.weapon.player').attr('src', $('.player.weapon.cache').attr('src'))

setTimeout showscore, 4000
