// Bloco E: Coleções

void main(){
  print('- Exercício E1 ');
  e1();

  print('\n- Exercício E2 ');
  e2();

  print('\n- Exercício E3 ');
  e3();

  print('\n- Exercício E4 ');
  e4();

  print('\n- Exercício E5 ');
  e5();

  print('\n- Exercício E6 ');
  e6();

  print('\n- Exercício E7 ');
  e7();
}

// Atividade 1
void e1(){
  List<String> culturas = ['Soja', 'Milho', 'Sorgo'];
  print('Lista inicial: $culturas');

  // Adicionando um elemento
  culturas.add('Girassol');

  // Removendo um elemento
  culturas.remove('Milho');

  print('Lista atualizada: $culturas');
  print('Tamanho da lista: ${culturas.length}');
  print('Primeiro elemento: ${culturas.first}');
  print('Último elemento: ${culturas.last}');
}

// Atividade 2
void e2(){
  List<String> culturasRepetidas = [
    'Soja',
    'Milho',
    'Soja',
    'Sorgo',
    'Milho',
    'Cana-de-açúcar'
  ];

  // Convertendo a Lista em um Conjunto (Set)
  Set<String> culturasUnicas = culturasRepetidas.toSet();

  print('Lista original (com repetições): $culturasRepetidas');
  print('Conjunto / Set (sem repetições): $culturasUnicas');
}

// Atividade 3
void e3(){
  Map<String, double> cotacoes = {
    'soja': 128.40,
    'milho': 56.20,
    'sorgo': 48.00,
  };

  // Acrescenta uma nova entrada
  cotacoes['trigo'] = 82.50;

  // Consulta chave existente
  print('Cotação da soja: R\$ ${cotacoes['soja']}');

  // Consulta chave inexistente
  var cotacaoCafe = cotacoes['cafe'];
  print('Cotação do café: $cotacaoCafe');
  // Observação: Quando a chave não existe no Map, o Dart devolve 'null'
}

// Atividade 4
void e4(){
  Map<String, double> cotacoes = {
    'soja': 128.40,
    'milho': 56.20,
    'sorgo': 48.00,
    'trigo': 82.50,
  };

  for (final entry in cotacoes.entries) {
    String preco = entry.value.toStringAsFixed(2).replaceAll('.', ',');
    print('${entry.key}: R\$ $preco');
  }
}

// Atividade 5
void e5() {
  const double alqueireGoiano = 4.84;
  List<double> areas = [25.0, 50.0, 15.0, 80.0, 35.0, 10.0];

  double totalAlqueires = areas
      .where((area) => area > 30.0)
      .map((area) => area / alqueireGoiano)
      .fold(0.0, (soma, alq) => soma + alq);

  print('Total em alqueires (talhões > 30ha): ${totalAlqueires.toStringAsFixed(2)} alq');
}

// Atividade 6
void e6() {
  List<double> areas = [25.0, 50.0, 15.0, 80.0, 35.0, 12.0];

  // any: verifica se pelo menos um elemento atende ao critério
  bool temMaiorQue40 = areas.any((area) => area > 40.0);

  // every: verifica se todos os elementos atendem ao critério
  bool todosMaiorQue10 = areas.every((area) => area > 10.0);

  // firstWhere: encontra o primeiro elemento que satisfaz a condição
  double primeiroMenorQue20 = areas.firstWhere((area) => area < 20.0);

  print('Existe algum talhão acima de 40 ha? $temMaiorQue40');
  print('Todos têm mais de 10 ha? $todosMaiorQue10');
  print('Primeiro talhão abaixo de 20 ha: ${primeiroMenorQue20}ha');
}

// Atividade 7
void e7() {
  List<double> areas = [25.0, 50.0, 15.0, 80.0, 35.0, 12.0];

  // 1. Ordenação decrescente (do maior para o menor): b.compareTo(a)
  areas.sort((a, b) => b.compareTo(a));
  print('Ordem decrescente (maior para o menor): $areas');

  // 2. Invertendo para ordem crescente apenas trocando a ordem dos operandos: a.compareTo(b)
  areas.sort((a, b) => a.compareTo(b));
  print('Ordem crescente (menor para o maior): $areas');
}