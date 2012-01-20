# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#preview_link').click ->
    $form = $('form')
    post =
      title:     $form.find('#post_title').val()
      body:      $form.find('#post_body').val()
      published: $form.find('#post_published').attr("checked")?

    $('#preview').html poirot.skin(post)