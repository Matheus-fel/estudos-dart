// Bloco D: Decisão e Repetição

void main(){
  print('- Exercício D1 ');
  d1();

  print('\n- Exercício D2 ');
  d2();

  print('\n- Exercício D3 ');
  d3();

  print('\n- Exercício D4 ');
  d4();

  print('\n- Exercício D5 ');
  d5();

  print('\n- Exercício D6 ');
  d6();
}

//Atividade 1
void d1(){
  double produtividade = 65.0;

  if(produtividade < 50.0){
    print('Produtividade: Baixa (menor que 50 sc/ha)');
  } else if (produtividade <= 70.0){
    print('Produtividade: Média (50 a 70 sc/ha)');
  } else {
    print('Produtividade: Alta (acima de 70 sc/ha)');
  }
}

// Atividade 2
void d2(){
  double produtividade = 75.0;

  String classificacao = switch(produtividade){
    < 50.0 => 'Baixa (< 50 sc/ha)',
    >= 50.0 && <= 70.0 => 'Média (50 a 70 sc/ha)',
    _ => 'Alta (> de 70 sc/ha)', // _ serve como o padrão (qualquer outro caso)
  };

  print('Classificação (Expressão Switch): $classificacao');
}

// Atividade 3
void d3(){
  const double alqueireGoiano = 4.84;

  print('Hectares (ha) | Alqueires Goianos (alq)');
  print('---------------------------------------');
  for (int ha = 10; ha <= 100; ha += 10) {
    double alq = ha / alqueireGoiano;
    print('$ha ha | ${alq.toStringAsFixed(2)} alq');
  }
}

// Atividade 4
void d4(){
  int estoque = 5000;
  int dias = 0;

  while(estoque > 0){
    estoque -= 350;
    dias++;
  }

  print('O estoque de 5000 sacas acabou em $dias dias.');
}

// Atividade 5
void d5(){
  List<String> mesesSafra = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho'
  ];

  int numero = 1;
  for (final mes in mesesSafra){
    print('$numero. $mes');
    numero++;
  }
}

// Atividade 6
void d6(){
  List<double> areas = [45.0, -10.0, 60.0, 0.0, 80.0, 50.0, 30.0];
  double somaTotal = 0;

  for (final area in areas) {
    // Pula áreas inválidas (menores ou iguais a zero)
    if (area <= 0) {
      continue;
    }

    somaTotal += area;
    print('Área adicionada: ${area}ha | Soma atual: ${somaTotal}ha');

    // Interrompe se o acumulado ultrapassar 200 ha
    if (somaTotal > 200.0) {
      print('Limite de 200 ha ultrapassado! Interrompendo a soma.');
      break;
    }
  }

  print('Soma final das áreas: ${somaTotal}ha');
}