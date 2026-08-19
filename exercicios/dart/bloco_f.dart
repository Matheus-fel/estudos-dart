// Bloco F: Funções

void main() {
  print('- Exercício F1 ');
  f1();

  print('\n- Exercício F2 ');
  f2();

  print('\n- Exercício F3 ');
  f3();

  print('\n- Exercício F4 ');
  f4();

  print('\n- Exercício F5 ');
  f5();
}

// Atividade 1
double converterParaAlqueires(double hectares) {
  const double alqueireGoiano = 4.84;
  return hectares / alqueireGoiano;
}

// Versão compacta com sintaxe de seta (=>):
double converterParaAlqueiresArrow(double hectares) => hectares / 4.84;

void f1() {
  double areaHa = 48.4;
  print('Versão tradicional: ${converterParaAlqueires(areaHa)} alqueires');
  print('Versão com seta (=>): ${converterParaAlqueiresArrow(areaHa)} alqueires');
}

// Atividade 2
String formatarNumero(double numero, [int casas = 1]) {
  return numero.toStringAsFixed(casas);
}

void f2() {
  double valor = 125.7689;

  // Chamada 1: Sem o segundo argumento (assume o padrão: 1 casa)
  print('Com padrão (1 casa): ${formatarNumero(valor)}');

  // Chamada 2: Informando o segundo argumento explicitamente (3 casas)
  print('Com 3 casas decimais: ${formatarNumero(valor, 3)}');
}

// Atividade 3
void exibirTalhao({
  required String nome,
  required double area,
  String cultura = 'Soja',
}) {
  print('Talhão: $nome | Área: ${area}ha | Cultura: $cultura');
}

void f3() {
  // Chamada 1: Invertendo a ordem e usando o valor padrão de cultura
  exibirTalhao(area: 75.0, nome: 'Talhão da Mata');

  // Chamada 2: Invertendo a ordem completa e informando a cultura
  exibirTalhao(cultura: 'Milho Safrinha', area: 120.5, nome: 'Talhão da Baixada');
}

// Atividade 4
void processarAreas(List<double> areas, double Function(double) transformacao) {
  List<double> resultado = [];
  for (final area in areas) {
    resultado.add(transformacao(area));
  }
  print('Áreas transformadas: $resultado');
}

void f4() {
  List<double> listaAreas = [10.0, 25.0, 50.0];

  print('Transformação 1: Converter hectares para alqueires');
  processarAreas(listaAreas, (area) => area / 4.84);

  print('Transformação 2: Aplicar acréscimo de 10% na área');
  processarAreas(listaAreas, (area) => area * 1.10);
}

// Atividade 5
double calcularReceitaBruta({
  required double area,
  required double produtividade,
  required double precoSaca,
}) {
  // Receita = Área (ha) * Produtividade (sc/ha) * Preço por saca (R$)
  return area * produtividade * precoSaca;
}

void f5() {
  double receita = calcularReceitaBruta(
    area: 50.0,
    produtividade: 65.0,
    precoSaca: 128.40,
  );

  print('Receita Bruta Estimada: R\$ ${receita.toStringAsFixed(2).replaceAll('.', ',')}');
}