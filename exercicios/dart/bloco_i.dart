// Bloco I: Código assíncrono

void main() async {
  print('- Exercício I1 ');
  await i1();

  print('\n- Exercício I2 ');
  i2();

  // Aguarda 3 segundos para que a chamada do I2 termine antes de rodar o I3
  await Future.delayed(Duration(seconds: 3));

  print('\n- Exercício I3 ');
  await i3();
}

// Função utilitária que simula a leitura de umidade do solo com delay de 2 segundos
Future<double> lerSensorUmidade(String sensorId) async {
  await Future.delayed(Duration(seconds: 2));
  return 42.5; // Exemplo: 42.5% de umidade no solo
}

// Atividade 1
Future<void> i1() async {
  print('Solicitando leitura do sensor de umidade...');
  double umidade = await lerSensorUmidade('Sensor-01');
  print('Leitura concluída! Umidade atual: $umidade%');
}

// Atividade 2
void i2() {
  print('Iniciando leitura sem await...');
  var resultado = lerSensorUmidade('Sensor-02');
  print('Valor retornado no console: $resultado');

  /*
    Explicação do que apareceu no console:
    Apareceu 'Instance of 'Future<double>''.
    Como não usamos o operador 'await', o Dart não pausou a execução para 
    esperar os 2 segundos do sensor. Ele retornou imediatamente o objeto Future, 
    que representa uma 'promessa' de um valor que só estará disponível no futuro.
  */
}

// Atividade 3
Future<void> i3() async {
  var cronometro = Stopwatch();

  // 1. Execução Sequencial (uma após a outra)
  print('Iniciando 3 leituras sequenciais...');
  cronometro.start();

  double l1 = await lerSensorUmidade('Sensor-A');
  double l2 = await lerSensorUmidade('Sensor-B');
  double l3 = await lerSensorUmidade('Sensor-C');

  cronometro.stop();
  int tempoSequencial = cronometro.elapsedMilliseconds;
  print('Resultados: [$l1, $l2, $l3]');
  print('Tempo sequencial total: ${tempoSequencial}ms (~6 segundos)\n');

  // 2. Execução Simultânea / Paralela com Future.wait
  print('Iniciando 3 leituras simultâneas com Future.wait...');
  cronometro.reset();
  cronometro.start();

  List<double> resultados = await Future.wait([
    lerSensorUmidade('Sensor-A'),
    lerSensorUmidade('Sensor-B'),
    lerSensorUmidade('Sensor-C'),
  ]);

  cronometro.stop();
  int tempoParalelo = cronometro.elapsedMilliseconds;
  print('Resultados: $resultados');
  print('Tempo paralelo total: ${tempoParalelo}ms (~2 segundos)');

  /*
    Explicação da diferença de tempo:
    - Na execução sequencial, cada leitura de 2s só começou após a anterior 
      terminar (2s + 2s + 2s = ~6s no total).
    - Com Future.wait, as três requisições foram disparadas concorrentemente ao 
      mesmo tempo. Como todas rodaram em paralelo, o tempo total foi apenas o tempo 
      da requisição mais demorada (~2s no total), reduzindo o tempo em ~66%.
  */
}