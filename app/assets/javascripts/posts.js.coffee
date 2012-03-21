# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  
  findPost = (id) ->
    posts = window.posts.filter (p) ->
      p.id == parseInt(id)
    posts[0]
    
  display = (action) ->
    $('.content').html(action).css({display:'none'}).show('slow')
  
  app = Davis ->
    @get '/posts', (req) ->
      display(poirot.list({posts:window.posts}))

    @get '/posts/new', (req, one, two) ->
      display(poirot.form())

    @get '/posts/preview', (req) ->
      $form = $('form')
      post =
        title:     $form.find('#post_title').val()
        body:      $form.find('#post_body').val()
        published: $form.find('#post_published').attr("checked")?

      $('#preview').html poirot.skin(post)

    @get '/posts/:id/edit', (req) ->
      post = findPost(req.params.id)
      display(poirot.form(post))

    @get '/posts/:id', (req) ->
      post = findPost(req.params.id)
      display(poirot.skin(post))

  app.start();
