# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

showscore = () ->
  $('.score.player').removeClass('hidden')
  $('.weapon.player').attr('src', $('.player.weapon.cache').attr('src'))

showbanner = () ->
  # banner = $('#banner').attr('data')
  # $('.banner).attr('src', '$('#banner').attr('data'))
  $('#myModal').modal('show')

setTimeout showscore, 1000
setTimeout showbanner, 1500