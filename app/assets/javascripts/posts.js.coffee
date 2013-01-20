$ ->

   members  = "This post will be visible only to logged in members."
   everyone = "This post will be visible to all visitors."

   $('#image').hide()
   $('#video').hide()
   $('#publichelp').text(members)

   $('#submit').click ->
      if($('#post_image').val() != "" && $('#post_video').val() != "")
         alert('You can not have an image and a video link\n in a single post, please remove one.')
         false
      else
         true

   $('#post_image').click ->
      $('#image').show('slow')
      $('#video').hide('slow')
      $('.ytstuff').hide('slow')

   $('#post_video').click ->
      $('#video').show('slow')
      $('#image').hide('slow')
      $('.imgstuff').hide('slow')

   $('#post_public').click ->
     if($('#post_public').is(':checked'))
        $('#publichelp').text(everyone)
     else
        $('#publichelp').text(members)

   $('#post_image').change ->
      if(!!$('#post_image').val())
         $('#previewImg').attr('src', $('#post_image').val())
      else if(!$('#post_image').val())
         $('#previewImg').attr('alt', "Please enter a valid image")

   $('#vidInstead').click ->
      $('.ytstuff').show('slow')
      $('#video').show('slow')
      $('#image').hide('slow')
      $('.imgstuff').hide('slow')


   $('#imgInstead').click ->
      $('.ytstuff').hide('slow')
      $('#video').hide('slow')
      $('#image').show('slow')
      $('.imgstuff').show('slow')

   $('.deletePost').click ->
      confirm("Really delete post?")
