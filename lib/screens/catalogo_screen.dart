import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../widgets/produto_card.dart';
import 'detalhes_produto_screen.dart';

/// Tela principal: gerencia o estado da lista e a renderiza com ListView.builder.
class CatalogoScreen extends StatefulWidget {
  const CatalogoScreen({super.key});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  final List<Produto> _produtos = [
    const Produto(id: '1', nome: 'Smartphone Galaxy S24', preco: 4500.00, categoria: 'Eletrônicos', icone: '📱'),
    const Produto(id: '2', nome: 'Notebook Dell XPS', preco: 8900.00, categoria: 'Informática', icone: '💻'),
    const Produto(id: '3', nome: 'Fone Bluetooth Sony', preco: 1200.00, categoria: 'Áudio', icone: '🎧'),
    const Produto(id: '4', nome: 'Smartwatch Garmin', preco: 2300.00, categoria: 'Wearables', icone: '⌚'),
    const Produto(id: '5', nome: 'Teclado Mecânico RGB', preco: 450.00, categoria: 'Periféricos', icone: '⌨️'),
  ];

  // Produtos usados pelo FAB para inclusão dinâmica (Desafio Nível 1).
  static const List<(String, double, String, String)> _sugestoes = [
    ('Mouse Gamer Logitech', 350.00, 'Periféricos', '🖱️'),
    ('Monitor LG UltraWide', 1900.00, 'Informática', '🖥️'),
    ('Caixa de Som JBL', 800.00, 'Áudio', '🔊'),
    ('Câmera Canon EOS', 5200.00, 'Fotografia', '📷'),
    ('Console PlayStation 5', 3800.00, 'Games', '🎮'),
  ];

  int _proximoId = 6;

  /// Desafio Nível 1: adiciona um novo produto à lista via setState().
  void _adicionarProduto() {
    final (nome, preco, categoria, icone) = _sugestoes[(_proximoId - 6) % _sugestoes.length];
    setState(() {
      _produtos.add(Produto(
        id: '$_proximoId',
        nome: nome,
        preco: preco,
        categoria: categoria,
        icone: icone,
      ));
      _proximoId++;
    });
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('Produto adicionado: $nome'), duration: const Duration(seconds: 1)));
  }

  /// Desafio Nível 2: remove o produto deslizado, com opção de desfazer.
  void _removerProduto(int index) {
    final removido = _produtos[index];
    setState(() => _produtos.removeAt(index));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('Removido: ${removido.nome}'),
          action: SnackBarAction(
            label: 'Desfazer',
            onPressed: () => setState(() => _produtos.insert(index, removido)),
          ),
        ),
      );
  }

  /// Desafio Nível 3: navega para a tela de detalhes passando o Produto via construtor.
  void _abrirDetalhes(Produto produto) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => DetalhesProdutoScreen(produto: produto)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Produtos'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text('Itens: ${_produtos.length}', style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: _produtos.isEmpty
          ? const Center(child: Text('Nenhum produto no catálogo.\nToque em + para adicionar.', textAlign: TextAlign.center))
          // ListView.builder constrói os itens sob demanda (lazy loading).
          : ListView.builder(
              padding: const EdgeInsets.only(top: 6, bottom: 88),
              itemCount: _produtos.length,
              itemBuilder: (context, index) {
                final produto = _produtos[index];
                return Dismissible(
                  key: ValueKey(produto.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.delete, color: Theme.of(context).colorScheme.onError),
                  ),
                  onDismissed: (_) => _removerProduto(index),
                  child: ProdutoCard(
                    produto: produto,
                    onTap: () => _abrirDetalhes(produto),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _adicionarProduto,
        tooltip: 'Adicionar produto',
        child: const Icon(Icons.add),
      ),
    );
  }
}
