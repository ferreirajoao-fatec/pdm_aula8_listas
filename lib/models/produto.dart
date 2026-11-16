/// Modelo de dados imutável que representa um produto do catálogo.
class Produto {
  final String id;
  final String nome;
  final double preco;
  final String categoria;
  final String icone;

  const Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.categoria,
    required this.icone,
  });
}
