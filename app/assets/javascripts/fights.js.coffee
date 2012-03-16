# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

showscore = ->
  $('.score.player').removeClass('hidden')
  $('.weapon.player').attr('src', $('.player.weapon.cache').attr('src'))

showbanner = ->
  $('#winlose').modal('show')

`$('#winlose').on('hidden', function () {
  window.location = "http://buttongluttons.com/leaderboard";
  return false;
})`

setTimeout showscore, 2000
setTimeout showbanner, 2500