import 'package:flutter/material.dart';
import '../models/produto.dart';

/// Desafio Nível 3: tela de detalhes que recebe o Produto via construtor.
class DetalhesProdutoScreen extends StatelessWidget {
  final Produto produto;

  const DetalhesProdutoScreen({super.key, required this.produto});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Produto')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Center(
            child: CircleAvatar(
              radius: 56,
              backgroundColor: colors.primaryContainer,
              child: Text(produto.icone, style: const TextStyle(fontSize: 52)),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            produto.nome,
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Center(child: Chip(label: Text(produto.categoria))),
          const SizedBox(height: 24),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.sell_outlined),
                  title: const Text('Preço'),
                  trailing: Text(
                    'R\$ ${produto.preco.toStringAsFixed(2)}',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 18),
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.category_outlined),
                  title: const Text('Categoria'),
                  trailing: Text(produto.categoria),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.tag),
                  title: const Text('Código'),
                  trailing: Text(produto.id),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
