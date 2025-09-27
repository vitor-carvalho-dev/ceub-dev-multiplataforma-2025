//main() é ponto de partida nosso entrypoint
void main(List<String> args) async {
  print("-- Variáveis, tipos e coleções");
  String nome = "Fulana"; //fortemente tipada.
  var idade = 30; //é um int
  final double altura = 1.46;
  const PI = 3.14;
  dynamic qualquerCoisa = 1.56;

  List<String> frutas = ["Maçã", "banana"];
  Map<String, String> capitais = {
    'BSB': 'Brasília',
    'POA': 'Porto Alegre',
  };

  String? sobrenome;
  print(sobrenome);
  exibir(nome: "Fernando", sobreNome: sobrenome ?? "Dias", idade: 12);
  String testeNome = (sobrenome != null) ? "Dias" : "É Null";

  print(dobrar(numeroPi));

  Pessoa pessoa = Pessoa(idade: 12, nome: "Fernando");
  pessoa.apresentar();
  pessoa.voo();

  print(AppStatus.loading.msg);

  var result = await buscarDados();
  print(result);

  //RECORDS do Dart
  var (nomeUser, idadeUser) = getUserInfo();
  print("Nome: $nomeUser idade: $idadeUser");
}

void exibir({
  required String nome,
  required String sobreNome,
  int? idade,
}) {
  print(nome);
}

//Funções com =>
double dobrar(double valor) => valor * 2;

//properties
double get numeroPi => 3.14;

//Classes
//extends: Usando Herança
//implments: Usando Contrato com interface
class Pessoa extends SerHumano with Voar implements Nadador {
  String nome;
  int idade;
  //Construtor
  Pessoa({required this.nome, required this.idade});

  String apresentar() {
    return "Olá meu nome é ${nome.primeiraMaiscula()} e tenho $idade anos de vida";
  }

  @override
  void nadar() {
    // TODO: implement nadar
  }

  @override
  void prendeAr() {
    // TODO: implement prendeAr
  }
}

//Enum
enum AppStatus {
  loading("carregando.."),
  sucess("ok"),
  error("ops!");

  final String msg;
  const AppStatus(this.msg);
}

//Adiciona método em classes que não podem ser modificadas
extension StringExtension on String {
  String primeiraMaiscula() => "${this[0].toUpperCase()}${this.substring(1)}";
}

//mixin é um modo de criar multiplas heranças
mixin Voar {
  void voo() {
    print("Voando!");
  }
}

class SerHumano {}

abstract class Nadador {
  void nadar();

  void prendeAr() {
    print("prendendo ar....");
  }
}

//Future código async
Future<String> buscarDados() async {
  print("Buscando Dados.....");
  await Future.delayed(Duration(seconds: 5));
  return "Dado retornado!";
}

(String, int) getUserInfo() => ("Fernando", 36);
