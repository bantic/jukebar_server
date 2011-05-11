jQuery($ ->
  $(".vote").tap( ->
    that = $(this)
    song_id = $(this).data "song-id"
    $.mobile.pageLoading()
    $.post("/bars/1/bar_songs/#{ song_id }/vote.json", (data) ->
      console.log "got data,", data
      that.removeClass "ui-btn-active"
      $.mobile.pageLoading true
      $(".remaining_votes").text data.user.credits
      window.jukebar.voteForSong data.song
    )
  )
)

jQuery($ -> 
  if Pusher
    Pusher.log = () ->
      if window.console
        window.console.log.apply(window.console, arguments)
    
    WEB_SOCKET_DEBUG = true
    pusher = new Pusher('938c4515e56c8eb8108e')
    channel = pusher.subscribe('test_channel')
    channel.bind 'my_event', (data) ->
      console.log "got new test data: #{data}" 
    barchannel = pusher.subscribe "channel-bar-1"
    barchannel.bind "vote", (song) ->
      console.log "got song #{song}"
)

class window.JukebarClient
  constructor: (@songs={}) ->
  voteForSong: (song) ->
    song_div = $("#bar_song_#{song.id}")
    if song_div.length
      votes = parseInt song_div.find(".ui-li-count").html()
      console.log "found votes count",votes
      votes++
      console.log "new votes: ",votes
      song_div.find(".ui-li-count").html votes
    console.log "vote for song",song,"total votes: #{votes}"
    # @sortSongsbyVotes()
  sortSongsbyVotes: () ->
    bar_songs_list = $(".bar_song")
    bar_song_divs  = {}
    bar_songs_list.append(bar_songs_list.children("li").get().sort( (a,b) ->
      aVotes = parseInt($(a).find(".ui-li-count").text())
      bVotes = parseInt($(b).find(".ui-li-count").text())
      if (aVotes > bVotes) 1 else if (aVotes < bVotes) -1 else 0
    ).reverse())

jQuery($ ->
  window.jukebar = new window.JukebarClient
)