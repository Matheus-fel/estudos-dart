// Bloco J: Integradores

void main() async {
  print('= Exercício J1: Relatório da Propriedade \n');
  j1();

  print('\n= Exercício J2: Registro de Atividades \n');
  j2();

  print('\n= Exercício J3: Receita Estimada com Dados Assíncronos \n');
  await j3();
}

// Estruturas de apoio reaproveitadas dos blocos anteriores
enum Atividade {
  plantio('Plantio'),
  adubacao('Adubação'),
  pulverizacao('Pulverização'),
  colheita('Colheita');

  final String rotulo;
  const Atividade(this.rotulo);
}

class Talhao {
  final String nome;
  final double area;
  final String cultura;

  Talhao({required this.nome, required this.area, required this.cultura});

  @override
  String toString() => '$nome ($cultura) - ${area.toStringAsFixed(1).replaceAll('.', ',')} ha';
}

// Função auxiliar para formatação de números com vírgula decimal
String formatarBr(double valor, [int casas = 2]) {
  return valor.toStringAsFixed(casas).replaceAll('.', ',');
}

// ------------------------------------------
// Atividade 1
// ------------------------------------------
void j1() {
  List<Talhao> talhoes = [
    Talhao(nome: 'Talhão Sede', area: 50.0, cultura: 'Soja'),
    Talhao(nome: 'Talhão da Mata', area: 30.0, cultura: 'Milho'),
    Talhao(nome: 'Talhão do Córrego', area: 70.0, cultura: 'Soja'),
    Talhao(nome: 'Talhão da Serra', area: 25.0, cultura: 'Sorgo'),
    Talhao(nome: 'Talhão dos Buritis', area: 25.0, cultura: 'Milho'),
  ];

  // 1. Área Total
  double areaTotal = talhoes.fold(0.0, (soma, t) => soma + t.area);

  // 2. Agrupamento e soma de área por cultura
  Map<String, double> areaPorCultura = {};
  for (final t in talhoes) {
    areaPorCultura[t.cultura] = (areaPorCultura[t.cultura] ?? 0.0) + t.area;
  }

  // 3. Identificação do maior talhão
  Talhao maiorTalhao = talhoes.reduce((atual, proximo) => atual.area > proximo.area ? atual : proximo);

  // Impressão do Relatório Formatado no Padrão Brasileiro
  print('- RELATÓRIO DA PROPRIEDADE -');
  print('Área Total: ${formatarBr(areaTotal, 1)} ha');
  print('\nDistribuição por Cultura:');

  areaPorCultura.forEach((cultura, area) {
    double percentual = (area / areaTotal) * 100.0;
    print('• $cultura: ${formatarBr(area, 1)} ha (${formatarBr(percentual, 1)}%)');
  });

  print('\nMaior Talhão Cadastrado: ${maiorTalhao.nome} com ${formatarBr(maiorTalhao.area, 1)} ha (${maiorTalhao.cultura})');
}

// ------------------------------------------
// Atividade 2
// ------------------------------------------
class Registro {
  final Talhao talhao;
  final Atividade atividade;
  final DateTime data;
  final String? observacao;

  Registro({
    required this.talhao,
    required this.atividade,
    required this.data,
    this.observacao,
  }) {
    // Validação da data: não pode ser uma data futura
    if (data.isAfter(DateTime.now())) {
      throw ArgumentError('A data do registro (${data.day}/${data.month}/${data.year}) não pode ser no futuro.');
    }
  }

  String get dataFormatada => '${data.day.toString().padLeft(2, '0')}/${data.month.toString().padLeft(2, '0')}/${data.year}';

  @override
  String toString() {
    String obs = observacao != null ? ' | Obs: $observacao' : '';
    return '[$dataFormatada] ${atividade.rotulo}$obs';
  }
}

void j2() {
  var t1 = Talhao(nome: 'Talhão Sede', area: 50.0, cultura: 'Soja');
  var t2 = Talhao(nome: 'Talhão da Mata', area: 30.0, cultura: 'Milho');

  List<Registro> historico = [];

  // Inserções válidas
  try {
    historico.add(Registro(
      talhao: t1,
      atividade: Atividade.plantio,
      data: DateTime.now().subtract(Duration(days: 45)),
      observacao: 'Variedade Monsoy 6410',
    ));
    historico.add(Registro(
      talhao: t1,
      atividade: Atividade.adubacao,
      data: DateTime.now().subtract(Duration(days: 20)),
    ));
    historico.add(Registro(
      talhao: t2,
      atividade: Atividade.plantio,
      data: DateTime.now().subtract(Duration(days: 30)),
    ));
  } catch (e) {
    print('Erro ao cadastrar registro: $e');
  }

  // Testando a validação de data futura com lançamento de exceção
  try {
    print('Tentando inserir registro com data futura...');
    Registro(
      talhao: t2,
      atividade: Atividade.colheita,
      data: DateTime.now().add(Duration(days: 15)),
    );
  } catch (e) {
    print('Exceção tratada com sucesso: $e\n');
  }

  // Agrupando registros por Talhão
  Map<String, List<Registro>> registrosPorTalhao = {};
  for (final reg in historico) {
    registrosPorTalhao.putIfAbsent(reg.talhao.nome, () => []).add(reg);
  }

  // Impressão agrupada
  print('- HISTÓRICO DE ATIVIDADES AGRUPADO POR TALHÃO -');
  registrosPorTalhao.forEach((nomeTalhao, lista) {
    print('\nTalhão: $nomeTalhao');
    for (final r in lista) {
      print('  - $r');
    }
  });
}

// ------------------------------------------
// Atividade 3
// ------------------------------------------

// Simulação de serviço remoto de cotação de mercado
Future<double> consultarCotacao(String cultura) async {
  await Future.delayed(Duration(seconds: 1)); // Simula latência de rede

  // Simula cotação por saca
  return switch (cultura.toLowerCase()) {
    'soja' => 128.50,
    'milho' => 56.20,
    'sorgo' => 48.00,
    _ => throw Exception('Cotação indisponível para a cultura: $cultura'),
  };
}

Future<void> j3() async {
  List<Talhao> talhoes = [
    Talhao(nome: 'Talhão Sede', area: 50.0, cultura: 'Soja'),
    Talhao(nome: 'Talhão da Mata', area: 30.0, cultura: 'Milho'),
    Talhao(nome: 'Talhão da Serra', area: 20.0, cultura: 'Trigo'), // Cultura sem cotação
  ];

  // Produtividade estimada fixa em 60 sc/ha para a simulação
  const double produtividadeMedia = 60.0;
  double receitaTotalPropriedade = 0.0;

  print('Buscando cotações e calculando receitas...');

  for (final t in talhoes) {
    try {
      double precoSaca = await consultarCotacao(t.cultura);
      double totalSacas = t.area * produtividadeMedia;
      double receitaTalhao = totalSacas * precoSaca;
      receitaTotalPropriedade += receitaTalhao;

      print('\nTalhão: ${t.nome} (${t.cultura} - ${formatarBr(t.area, 1)} ha)');
      print('  -> Preço/Saca: R\$ ${formatarBr(precoSaca)}');
      print('  -> Produção Estimada: ${formatarBr(totalSacas, 0)} sc');
      print('  -> Receita Bruta: R\$ ${formatarBr(receitaTalhao)}');
    } catch (e) {
      print('\nTalhão: ${t.nome} (${t.cultura})');
      print('  -> [AVISO] Falha ao obter receita: $e');
    }
  }

  print('\n----------------------------------------------');
  print('RECEITA BRUTA TOTAL ESTIMADA: R\$ ${formatarBr(receitaTotalPropriedade)}');
  print('----------------------------------------------');
}