// Bloco B: Segurança contra nulo

void main(){
  print('- Exercício B1 ');
  b1();

  print('\n- Exercício B2 ');
  b2();

  print('\n- Exercício B3 ');
  b3();

  print('\n- Exercício B4 ');
  b4();

  print('\n- Exercício B5 ');
  b5();
}

// Atividade 1
void b1(){
  String? telefone;
  print('Telefone: ${telefone ?? "não informado"}');
}

// Atividade 2
void b2(){
  String? telefone;

  /*
    Explicação:
      Se tentarmos usar "print(telefone.length);" ele gera o erro de compilação:
      "Property 'length' cannot be accessed on 'String?' because it is potentially null.".
  */

  // Correção usando ?.
  // ignore: dead_null_aware_expression, dead_code
  print('Tamanho do telefone: ${telefone?.length}');
}

// Atividade 3
String classificarChuva(double? chuvaMm){
  if (chuvaMm == null){
    return 'sem registro';
  }
    
  if (chuvaMm < 20.0){
    return 'seca';
  }

  return 'normal';
}

void b3(){
  print('Registro nulo: ${classificarChuva(null)}');
  print('Registro 12.5mm: ${classificarChuva(12.5)}');
  print('Registro 35.0mm: ${classificarChuva(35.0)}');
}

// Atividade 4
double? calcularSacasPorHectare(double totalSacas, double areaHectares){
  if (areaHectares <= 0){
    return null;
  }

  return totalSacas / areaHectares;
}

void b4(){
  // Cenário 1: Testando com área inválida (0 hectares)
  double? resultadoInvalido = calcularSacasPorHectare(300, 0);

  if (resultadoInvalido != null) {
    print('Produtividade: ${resultadoInvalido.toStringAsFixed(2)} sc/ha');
  } else {
    print('Área inválida (zero ou negativa). O cálculo retornou null.');
  }

  // Cenário 2: Testando com área válida (5 hectares)
  double? resultadoValido = calcularSacasPorHectare(300, 5);

  if (resultadoValido != null) {
    print('Produtividade: ${resultadoValido.toStringAsFixed(2)} sc/ha');
  } else {
    print('Área inválida.');
  }
}

// Atividade 5
void b5() {
  String? textoNulo; // Variável declarada como anulável e sem valor (null)

  try {
    // Forçando o acesso com o operador '!' em uma variável que sabemos ser nula
    print(textoNulo!.length);
  } catch (e) {
    print('Erro capturado em tempo de execução: $e');
  }

  /*
    Mensagem de erro capturada na execução:
    "Unexpected null value".

    Por que o operador ! deve ser evitado:

      1. O operador '!' tenta dizer ao Dart que essa variável nunca será nula, 
      desativando a proteção estática que o Null Safety oferece em tempo de compilação.

      2. Se a variável for nula quando a linha for executada, a aplicação não consegue continuar 
      e sofre uma exceção grave em tempo de execução (quebra do app para o usuário).

      3. É melhor utilizar o operador seguro (?.), o valor reserva (??) 
      ou checagens explícitas com 'if (variavel != null)'.
  */
}