// Bloco A: Variáveis, tipos e saída

void main() {
  print('- Exercício A1 ');
  a1();

  print('\n- Exercício A2 ');
  a2();

  print('\n- Exercício A3 ');
  a3();

  print('\n- Exercício A4 ');
  a4();

  print('\n- Exercício A5 ');
  a5();
}

// Atividade 1
void a1() {
  String produtor = 'João da Silva';
  String cidade = 'Ceres';
  double areaHectares = 150.5;
  int anoSafra = 2026;

  print('Produtor: $produtor | Cidade: $cidade | Área: ${areaHectares}ha | Safra: $anoSafra');
}

// Atividade 2
void a2() {
  var produtor = 'João da Silva'; // Inferido como String
  var cidade = 'Ceres';           // Inferido como String
  var areaHectares = 150.5;       // Inferido como double
  var anoSafra = 2026;            // Inferido como int

  print('Produtor: $produtor | Cidade: $cidade | Área: ${areaHectares}ha | Safra: $anoSafra');
}

// Atividade 3
void a3() {
  const double alqueireGoiano = 4.84;
  final DateTime dataAtual = DateTime.now();

  // Se tentarmos usar: const DateTime dataAtual = DateTime.now();
  // Erro de compilação: "The expression launched is not a constant expression."
  /*
    Explicação:
      Se tentarmos usar "const DateTime dataAtual = DateTime.now();",
      ele gera o erro de compilação: "Cannot invoke a non-'const' constructor where a const expression is expected.".

      'const': É uma constante em tempo de compilação. O valor precisa ser conhecido antes do programa executar.
      'final': É uma constante em tempo de execução. O valor é definido uma única vez, 
        quando o código é executado (como DateTime.now(), que só é descoberto na execução).
  */

  print('Alqueire Goiano: $alqueireGoiano ha | Data da consulta: $dataAtual');
}

// Atividade 4
void a4() {
  const double alqueireGoiano = 4.84;
  double areaHectares = 100.0;
  double emAlqueires = areaHectares / alqueireGoiano;

  print('Área: ${emAlqueires.toStringAsFixed(2)} alqueires goianos');
}

// Atividade 5
void a5() {
  double cotacao1 = 125.50;
  double cotacao2 = 130.00;
  double cotacao3 = 122.80;

  // Descobrindo a maior cotação
  double maiorTemp = cotacao1 > cotacao2 ? cotacao1 : cotacao2;
  double maior = maiorTemp > cotacao3 ? maiorTemp : cotacao3;

  // Descobrindo a menor cotação
  double menorTemp = cotacao1 < cotacao2 ? cotacao1 : cotacao2;
  double menor = menorTemp < cotacao3 ? menorTemp : cotacao3;

  // Média
  double media = (cotacao1 + cotacao2 + cotacao3) / 3;

  print('Maior Cotação: R\$ ${maior.toStringAsFixed(2)}');
  print('Menor Cotação: R\$ ${menor.toStringAsFixed(2)}');
  print('Média: R\$ ${media.toStringAsFixed(2)}');
}