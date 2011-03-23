function sortBarSongsByVotes() {
  bar_songs_list = $("#bar_songs_list");
  bar_songs = bar_songs_list.children("li").get();
  sorted_bar_songs = bar_songs.sort(function(a,b) {
    var votesA = parseInt($(a).find(".actual_vote_count").html(), 10);
    var votesB = parseInt($(b).find(".actual_vote_count").html(), 10);
    return (votesA < votesB) ? 1 : (votesA > votesB) ? -1 : 0;    
  });
  bar_songs_list.empty();
  $.each(sorted_bar_songs, function(idx, song) { 
    console.log("idx: " + idx + ", song: " + song + " votes: " + $(song).data("votes"));
    bar_songs_list.append(song); 
  });
}