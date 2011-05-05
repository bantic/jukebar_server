jQuery($ ->
  $(".vote").tap( ->
    that = $(this)
    console.log $(this).data "song-id"
    song_id = $(this).data "song-id"
    $.post("/bars/1/bar_songs/#{ song_id }/vote", (data) ->
      that.removeClass "ui-btn-active"
      console.log "HI"
      console.log song_id
    );
  )
)