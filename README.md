# Atividade prática 3 — Aula 8: Listas Dinâmicas & Arquitetura

Programação para Dispositivos Móveis I — Prof. Diego Menegassi (2026/2)

Catálogo de produtos em Flutter organizado em arquitetura modular (`/models`, `/widgets`, `/screens`) e renderizado com `ListView.builder` (lazy loading / virtualização), usando Material Design 3.

## Estrutura

| Arquivo | Responsabilidade |
|---|---|
| `lib/models/produto.dart` | Modelo de dados imutável `Produto` |
| `lib/widgets/produto_card.dart` | Widget reutilizável com `Card`, `ListTile` e `CircleAvatar` |
| `lib/screens/catalogo_screen.dart` | Tela principal com `ListView.builder`, `AppBar` e `FloatingActionButton` |
| `lib/screens/detalhes_produto_screen.dart` | Tela de detalhes do produto (Desafio Nível 3) |
| `lib/main.dart` | `MaterialApp` com `ThemeData` Material 3 |

## Desafios implementados

- **Nível 1 — Inclusão dinâmica:** o `FloatingActionButton` adiciona um novo produto à lista via `setState()`.
- **Nível 2 — Remoção por gesto:** cada `ProdutoCard` está envolvido em um `Dismissible`; deslizar remove o item (com opção de desfazer).
- **Nível 3 — Navegação:** tocar em um card abre a `DetalhesProdutoScreen`, recebendo a instância de `Produto` via construtor.

## Como executar

```bash
flutter pub get
flutter run
flutter test
```
