function sortBarSongsByVotes() {
  bar_songs_list = $("#bar_songs_list");
  bar_songs = bar_songs_list.children("li").get();
  sorted_bar_songs = bar_songs.sort(function(a,b) {
    var votesA = parseInt($(a).data("votes"), 10);
    var votesB = parseInt($(b).data("votes"), 10);
    return (votesA < votesB) ? 1 : (votesA > votesB) ? -1 : 0;    
  });
  bar_songs_list.empty();
  $.each(sorted_bar_songs, function(idx, song) { 
    console.log("idx: " + idx + ", song: " + song);
    bar_songs_list.append(song); 
  });
}