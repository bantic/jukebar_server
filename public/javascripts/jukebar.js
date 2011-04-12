var songs;
function JukeBarClient() {
  this.songs = {};
  this.addSong = function(song) {
    this.songs[song.id] = song;
  };
  this.voteForSong = function(song) {
    this.songs[song.id].active_vote_count++;
    var votes = this.songs[song.id].active_vote_count;
    $("#bar_song_" + song.id + " .actual_vote_count").html(votes);
    console.log("vote for song %o", song,"total votes:",votes);
    this.sortBarSongsByVotes();
  };
  this.loadSongs = function(bar_id) {
    var that = this;
    jQuery.getJSON("/bars/" + bar_id + "/bar_songs/", function(song_array) {
      for (var i = 0; i < song_array.length; i++) {
        var song = new Song(song_array[i]);
        that.addSong(song);
      }
    });
  };
  
  this.sortBarSongsByVotes = function() {
    bar_songs_list = $("#bar_songs_list");
    bar_song_divs = {};
    bar_songs_list.append(bar_songs_list.children("li").get().sort(function(a,b) {
      var aVotes = $(a).find(".actual_vote_count").text(),
          bVotes = $(b).find(".actual_vote_count").text();
      return (aVotes > bVotes ? 1 : aVotes < bVotes ? -1 : 0);
    }).reverse());
  };
}

function Song(attributes) {
  this.id = attributes.id;
  this.artist = attributes.artist;
  this.name = attributes.name;
  this.bar_id = attributes.bar_id;
  this.active_vote_count = attributes.active_vote_count;
}

var jukebar = new JukeBarClient();
$(function() {
  jukebar.loadSongs(1);
  $(".bar_song").bind("ajax:success", function(evt, data, status, xhr) {
    console.log("ajax success!",arguments);
  });
  $(".bar_song").bind("ajax:error", function(evt, data, status, xhr) {
    alert("You need to get more credits!");
    console.log("ajax error!",arguments);
  });
});