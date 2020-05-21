class Movie {
  final String title;
  final String year;
  final List<String> genre;
  final String poster;
  final String imdbID;

  Movie({this.title, this.year, this.genre, this.poster, this.imdbID});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['Title'],
        year: json['Year'],
        genre: json['Type'],
        poster: json['Poster'],
        imdbID: json['imdbID']);
  }
}