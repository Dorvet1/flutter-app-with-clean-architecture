class ViaCepError implements Exception {}

class ViaCepErro extends ViaCepError {
  final String msg;
  ViaCepErro(this.msg);
}
