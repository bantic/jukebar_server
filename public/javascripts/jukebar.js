var songs;
function JukeBarClient() {
  this.songs = {};
  this.votes = {};
  this.addSong = function(song) {
    this.songs[songs[i].id] = songs[i];
  }
  this.voteForSong = function(song) {
    this.votes[song.id] = this.votes[song.id] || 0;
    this.votes[song.id]++;
    console.log("vote for song %o", song);
  }
  this.loadSongs = function(bar_id) {
    jQuery.getJSON("/bars/" + bar_id + "/bar_songs/", function(song_array) {
      for (var i = 0; i < song_array.length; i++) {
        var song = new Song(song_array[i]);
        this.addSong(song);
      }
    });
  }
}

function Song(attributes) {
  this.id = attributes.id;
  this.artist = attributes.artist;
  this.name = attributes.name;
  this.bar_id = attributes.bar_id;
}

var jukebar = new JukeBarClient();