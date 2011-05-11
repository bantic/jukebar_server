/* DO NOT MODIFY. This file was compiled Wed, 11 May 2011 02:02:33 GMT from
 * /Users/coryforsyth/Sites/jukebar_server/app/coffeescripts/jukebarcoffee.coffee
 */

(function() {
  jQuery($(function() {
    return $(".vote").tap(function() {
      var song_id, that;
      that = $(this);
      song_id = $(this).data("song-id");
      $.mobile.pageLoading();
      return $.post("/bars/1/bar_songs/" + song_id + "/vote.json", function(data) {
        console.log("got data,", data);
        that.removeClass("ui-btn-active");
        $.mobile.pageLoading(true);
        $(".remaining_votes").text(data.user.credits);
        return window.jukebar.voteForSong(data.song);
      });
    });
  }));
  jQuery($(function() {
    var WEB_SOCKET_DEBUG, barchannel, channel, pusher;
    if (Pusher) {
      Pusher.log = function() {
        if (window.console) {
          return window.console.log.apply(window.console, arguments);
        }
      };
      WEB_SOCKET_DEBUG = true;
      pusher = new Pusher('938c4515e56c8eb8108e');
      channel = pusher.subscribe('test_channel');
      channel.bind('my_event', function(data) {
        return console.log("got new test data: " + data);
      });
      barchannel = pusher.subscribe("channel-bar-1");
      return barchannel.bind("vote", function(song) {
        return console.log("got song " + song);
      });
    }
  }));
  window.JukebarClient = (function() {
    function JukebarClient(songs) {
      this.songs = songs != null ? songs : {};
    }
    JukebarClient.prototype.voteForSong = function(song) {
      var song_div, votes;
      song_div = $("#bar_song_" + song.id);
      if (song_div.length) {
        votes = parseInt(song_div.find(".ui-li-count").html());
        console.log("found votes count", votes);
        votes++;
        console.log("new votes: ", votes);
        song_div.find(".ui-li-count").html(votes);
      }
      return console.log("vote for song", song, "total votes: " + votes);
    };
    JukebarClient.prototype.sortSongsbyVotes = function() {
      var bar_song_divs, bar_songs_list;
      bar_songs_list = $(".bar_song");
      bar_song_divs = {};
      return bar_songs_list.append(bar_songs_list.children("li").get().sort(function(a, b) {
        var aVotes, bVotes;
        aVotes = parseInt($(a).find(".ui-li-count").text());
        bVotes = parseInt($(b).find(".ui-li-count").text());
        if ((aVotes > bVotes)(1)) {
          ;
        } else if ((aVotes < bVotes)(-1)) {
          ;
        } else {
          return 0;
        }
      }).reverse());
    };
    return JukebarClient;
  })();
  jQuery($(function() {
    return window.jukebar = new window.JukebarClient;
  }));
}).call(this);
