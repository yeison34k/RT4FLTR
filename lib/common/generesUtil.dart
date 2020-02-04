Map<int, String> _genreMap = {
  28: 'Acción',
  12: 'Aventura',
  16: 'Animación',
  35: 'Comedia',
  80: 'Crimen',
  99: 'Documental',
  18: 'Drama',
  10751: 'Familia',
  14: 'Fantasía',
  36: 'Historia',
  27: 'Terror',
  10402: 'Música',
  9648: 'Misterio',
  10749: 'Romance',
  878: 'Ciencia ficción',
  10770: 'película de la televisión',
  53: 'Suspenso',
  10752: 'Guerra',
  37: 'Oeste',
  10759: 'Acción & Aventura',
  10762: "Infantil",
  10763: 'Noticias',
  10764: 'Realities',
  10765: 'Sci-Fi & Fantasia',
  10766: 'Serial',
  10767: 'Conversación',
  10768: 'Guerra & Politica',
};

List<String> generelist(List<dynamic> generateIds) =>
    generateIds.map((id) => _genreMap[id]).toList();

String getGeneresValues(List<dynamic> generateIds) {
  StringBuffer str = new StringBuffer();
   str.writeAll(generelist(generateIds), ", ");
  return str.toString();
}