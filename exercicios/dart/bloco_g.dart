// Bloco G: Classes e objetos

void main() {
  print('- Exercício G1 e G2 ');
  g1Eg2();

  print('\n- Exercício G3 e G4 ');
  g3Eg4();

  print('\n- Exercício G5 ');
  g5();

  print('\n- Exercício G6 ');
  g6();

  print('\n- Exercício G7 ');
  g7();
}

// Atividade 1 e 2
class Produtor {
  final String nome;
  final String cidade;
  final String? telefone; // Opcional (pode ser nulo)

  // G1: Construtor com parâmetros nomeados obrigatórios
  Produtor({
    required this.nome,
    required this.cidade,
    required this.telefone,
  });

  // G2: Construtor nomeado que dispensa o telefone
  Produtor.semTelefone({
    required this.nome,
    required this.cidade,
  }) : telefone = null;
}

void g1Eg2() {
  var p1 = Produtor(nome: 'Antônio Ferreira', cidade: 'Ceres', telefone: '62 99999-1111');
  var p2 = Produtor.semTelefone(nome: 'Maria Silva', cidade: 'Rialma');

  print('Produtor 1: ${p1.nome} | ${p1.cidade} | Tel: ${p1.telefone}');
  print('Produtor 2: ${p2.nome} | ${p2.cidade} | Tel: ${p2.telefone ?? "Não informado"}');
}

// Atividade 3, 4 e 5
class Talhao {
  final String nome;
  final double area;
  final String cultura;

  // G5: Constante static com o valor do alqueire goiano
  static const double alqueireGoiano = 4.84;

  Talhao({
    required this.nome,
    required this.area,
    required this.cultura,
  });

  // G3 e G5: Campo calculado (getter) usando a constante estática
  double get areaEmAlqueires => area / alqueireGoiano;

  // G3: Campo calculado booleano (menos de 20 ha)
  bool get ehPequeno => area < 20.0;

  // G4: Sobrescrita do método toString()
  @override
  String toString() {
    return 'Talhao(nome: $nome, area: ${area}ha, cultura: $cultura, alqueires: ${areaEmAlqueires.toStringAsFixed(2)} alq)';
  }
}

void g3Eg4() {
  var t1 = Talhao(nome: 'Talhão da Sede', area: 48.4, cultura: 'Milho');
  var t2 = Talhao(nome: 'Talhão do Córrego', area: 15.0, cultura: 'Soja');

  // G4: Impressão direta com o toString sobrescrito
  print(t1);
  print(t2);

  // G3: Acessando os campos calculados
  print('${t1.nome} é menor que 20 ha? ${t1.ehPequeno}');
  print('${t2.nome} é menor que 20 ha? ${t2.ehPequeno}');
}

void g5() {
  // G5: Acessando a constante estática diretamente da classe (sem instanciar objeto)
  print('Valor do Alqueire Goiano acessado via classe: ${Talhao.alqueireGoiano} ha');
}

// Atividade 6
void g6() {
  List<Talhao> talhoes = [
    Talhao(nome: 'Talhão Norte', area: 60.0, cultura: 'Soja'),
    Talhao(nome: 'Talhão Sul', area: 25.0, cultura: 'Milho'),
    Talhao(nome: 'Talhão Leste', area: 90.0, cultura: 'Soja'),
    Talhao(nome: 'Talhão Oeste', area: 15.0, cultura: 'Sorgo'),
  ];

  // Área total usando fold
  double areaTotal = talhoes.fold(0.0, (soma, t) => soma + t.area);

  // Filtro por cultura (apenas Soja)
  List<Talhao> talhoesSoja = talhoes.where((t) => t.cultura == 'Soja').toList();

  // Maior talhão usando reduce
  Talhao maiorTalhao = talhoes.reduce((atual, proximo) => atual.area > proximo.area ? atual : proximo);

  print('Área Total da Propriedade: ${areaTotal}ha');
  print('Talhões com cultivo de Soja: ${talhoesSoja.map((t) => t.nome).toList()}');
  print('Maior Talhão: ${maiorTalhao.nome} com ${maiorTalhao.area}ha');
  /*
    Comparação com a versão que usava mapas (Bloco E):
    O uso de objetos com classes tipadas (Talhao) torna o código muito mais seguro e 
    legível. Não corremos o risco de errar o nome de chaves (como 'area' ou 'cultura') 
    em tempo de execução, ganhamos autocomplete do editor e encapsulamento dos cálculos.
  */
}

// Atividade 7
abstract class Cultura {
  final String nome;
  final int cicloEmDias;

  Cultura({required this.nome, required this.cicloEmDias});

  // Método que será implementado pelas subclasses
  String get resumo;
}

class Soja extends Cultura {
  final String variedade;

  Soja({required int cicloEmDias, required this.variedade})
      : super(nome: 'Soja', cicloEmDias: cicloEmDias);

  @override
  String get resumo => 'Cultura: $nome (Variedade: $variedade) | Ciclo: $cicloEmDias dias';
}

class Milho extends Cultura {
  final String finalidade; // Ex: Grão ou Silagem

  Milho({required int cicloEmDias, required this.finalidade})
      : super(nome: 'Milho', cicloEmDias: cicloEmDias);

  @override
  String get resumo => 'Cultura: $nome (Finalidade: $finalidade) | Ciclo: $cicloEmDias dias';
}

void g7() {
  // Lista do tipo da classe abstrata guardando subclasses concretas
  List<Cultura> culturas = [
    Soja(cicloEmDias: 110, variedade: 'Monsoy 6410'),
    Milho(cicloEmDias: 135, finalidade: 'Grão Safrinha'),
  ];

  print('Resumo das Culturas Cadastradas:');
  for (final c in culturas) {
    print('- ${c.resumo}');
  }
}