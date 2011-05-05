/* DO NOT MODIFY. This file was compiled Thu, 05 May 2011 04:08:00 GMT from
 * /Users/coryforsyth/Sites/jukebar_server/app/coffeescripts/jukebarcoffee.coffee
 */

(function() {
  jQuery($(function() {
    return $(".vote").tap(function() {
      var song_id, that;
      that = $(this);
      console.log($(this).data("song-id"));
      song_id = $(this).data("song-id");
      return $.post("/bars/1/bar_songs/" + song_id + "/vote", function(data) {
        that.removeClass("ui-btn-active");
        console.log("HI");
        return console.log(song_id);
      });
    });
  }));
}).call(this);
