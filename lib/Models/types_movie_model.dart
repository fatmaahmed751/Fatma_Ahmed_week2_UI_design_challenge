class TypesOfMovies{
  final String type;

  TypesOfMovies({required this.type});

 static final List<TypesOfMovies> typesOfMovie=[
    TypesOfMovies(type: 'All'),
    TypesOfMovies(type: 'Popular'),
    TypesOfMovies(type: 'Trending'),
    TypesOfMovies (type: 'New Releases'),
    TypesOfMovies (type: 'Top Movies'),
  ];
}