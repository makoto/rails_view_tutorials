# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  app = Davis ->
    @get '/posts', (req) ->
      $('body').html(poirot.list({posts:window.posts}))

    @get '/posts/new', (req, one, two) ->
      $('body').html(poirot.form())

    @get '/posts/preview', (req) ->
      $form = $('form')
      post =
        title:     $form.find('#post_title').val()
        body:      $form.find('#post_body').val()
        published: $form.find('#post_published').attr("checked")?

      $('#preview').html poirot.skin(post)

    @get '/posts/:id/edit', (req) ->
      posts = window.posts.filter (p) ->
        p.id == parseInt(req.params.id)

      $('body').html(poirot.form(posts[0]))

    @get '/posts/:id', (req) ->
      posts = window.posts.filter (p) ->
        p.id == parseInt(req.params.id)
        
      $('body').html(poirot.skin(posts[0]))

  app.start();
