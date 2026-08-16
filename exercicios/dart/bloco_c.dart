// Bloco C: Texto

void main(){
  print('- Exercício C1 ');
  c1();

  print('\n- Exercício C2 ');
  c2();

  print('\n- Exercício C3 ');
  c3();

  print('\n- Exercício C4 ');
  c4();
}

// Atividade 1
void c1(){
  int talhao = 3;
  double hectares = 42.0;
  String plantacao = "milho";

  String frase = 'O Talhão $talhao tem ${hectares.toStringAsFixed(1)} ha plantados com $plantacao';
  print(frase);
}

// Atividade 2
void c2(){
  double valor = 1250.75;

  // toStringAsFixed fixa 2 casas após a vírgula, e o replaceAll troca o ponto por vírgula.
  String valorFormatado = '${valor.toStringAsFixed(2).replaceAll('.', ',')}';

  print('Valor: R\$ $valorFormatado');
}

// Atividade 3
void c3(){
  String enderecoCooperativa = '''
  Cooperativa Agropecuária do Vale de São Patrício
  Av. Brasil, nº 1500 - Setor Sul
  Ceres - GO
  CEP 76300-000
  ''';

  print(enderecoCooperativa); 
}

// Atividade 4
void c4(){
  String lista = ' soja , milho , sorgo ';

  // 1. split(',') divide o texto pelas vírgulas.
  // 2. map com trim() remove espaços extras e toUpperCase() passa para maiúsculas.
  // 3. toList() converte o resultado de volta para uma Lista.
  List<String> culturas = lista
    .split(',')
    .map((cultura) => cultura.trim().toUpperCase())
    .toList();

  print(culturas);
}