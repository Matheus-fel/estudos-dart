// Bloco H: Enums e exceções

void main() {
  print('- Exercício H1 ');
  h1();

  print('\n- Exercício H2 ');
  h2();

  print('\n- Exercício H3 ');
  h3();

  print('\n- Exercício H4 ');
  h4();
}

// Atividade 1
enum AtividadeSimples { plantio, adubacao, pulverizacao, colheita }

String descricaoAtividade(AtividadeSimples atividade) {
  return switch (atividade) {
    AtividadeSimples.plantio => 'Semeadura das sementes no solo.',
    AtividadeSimples.adubacao => 'Aplicação de fertilizantes e nutrientes.',
    AtividadeSimples.pulverizacao => 'Aplicação de defensivos e manejo de pragas.',
    AtividadeSimples.colheita => 'Recolhimento dos grãos maduros.',
  };
}

void h1() {
  for (final atv in AtividadeSimples.values) {
    print('${atv.name}: ${descricaoAtividade(atv)}');
  }
}

// Atividade 2
enum Atividade {
  plantio('Plantio', false),
  adubacao('Adubação', false),
  pulverizacao('Pulverização', true),
  colheita('Colheita', false);

  final String rotulo;
  final bool exigeRegistroDefensivo;

  const Atividade(this.rotulo, this.exigeRegistroDefensivo);
}

void h2() {
  for (final atv in Atividade.values) {
    String exige = atv.exigeRegistroDefensivo ? 'Sim' : 'Não';
    print('Atividade: ${atv.rotulo} | Exige defensivo: $exige');
  }
}

// Atividade 3
void validarArea(double area) {
  if (area <= 0) {
    throw ArgumentError('A área informada deve ser maior que zero (valor recebido: $area).');
  }
  print('Área validada com sucesso: ${area}ha');
}

void h3() {
  // Teste 1: Caso válido
  try {
    validarArea(50.0);
  } catch (e) {
    print('Erro capturado: $e');
  }

  // Teste 2: Caso inválido (dispara o ArgumentError)
  try {
    validarArea(-10.0);
  } catch (e) {
    print('Erro capturado: $e');
  }
}

// Atividade 4
void demonstrarFinally(double area) {
  print('\nExecutando teste com área = $area');
  try {
    validarArea(area);
    print('[Sucesso] Processamento concluído com êxito.');
  } catch (e) {
    print('[Erro] Exceção capturada: $e');
  } finally {
    // O bloco finally SEMPRE executa, com erro ou com sucesso
    print('[Finally] Bloco de finalização executado obrigatoriamente.');
  }
}

void h4() {
  // Caso de sucesso (área positiva)
  demonstrarFinally(42.0);

  // Caso de erro (área zerada)
  demonstrarFinally(0.0);
}