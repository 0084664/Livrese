class Livro {
  final String titulo;
  final String autor;

  Livro({
   this.titulo,
   this.autor,
  });

  livroMock() {
    return new Livro(autor: "Ray Bradubury", titulo: "Fahrenhei 451");
  }
}
