import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pdm_aula8_listas/main.dart';

void main() {
  testWidgets('exibe o catálogo inicial com 5 itens', (tester) async {
    await tester.pumpWidget(const MeuApp());
    expect(find.text('Catálogo de Produtos'), findsOneWidget);
    expect(find.text('Itens: 5'), findsOneWidget);
    expect(find.text('Smartphone Galaxy S24'), findsOneWidget);
  });

  testWidgets('FAB adiciona um produto (Nível 1)', (tester) async {
    await tester.pumpWidget(const MeuApp());
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();
    expect(find.text('Itens: 6'), findsOneWidget);
  });

  testWidgets('deslizar o card remove o produto (Nível 2)', (tester) async {
    await tester.pumpWidget(const MeuApp());
    await tester.drag(find.text('Smartphone Galaxy S24'), const Offset(-600, 0));
    await tester.pumpAndSettle();
    expect(find.text('Itens: 4'), findsOneWidget);
  });

  testWidgets('tocar no card abre a tela de detalhes (Nível 3)', (tester) async {
    await tester.pumpWidget(const MeuApp());
    await tester.tap(find.text('Notebook Dell XPS'));
    await tester.pumpAndSettle();
    expect(find.text('Detalhes do Produto'), findsOneWidget);
    expect(find.text('Notebook Dell XPS'), findsOneWidget);
  });
}
