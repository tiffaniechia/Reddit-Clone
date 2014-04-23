# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready -> 
  $('.vote-buttons .btn').on 'click', (event) ->
    event.preventDefault()
    url = $(this).closest('form').attr('action')

    $.post url

  dispatcher = new WebSocketRails(window.location.host + '/websocket')

  channel = dispatcher.subscribe 'votes' 

  channel.bind 'new', (post) ->
    if post.new_vote_count == 1
      suffix = ' vote'
    else
      suffix = ' votes'

    $(".votes-text[data-id=#{post.id}]").html(post.new_vote_count + suffix)



# $(document).ready(function(){ 
#   $('.vote-buttons .btn').on('click', function(event) {
# 
#     event.preventDefault();
#     var url = $(this).closest('form').attr('action');
#     var voteCount = $(this).closest('.post').find('.votes-text');
# 
#     $.post(url, function(post) {
#       voteCount.html(post.vote_count + " votes");
#     });
# 
#   });
#  