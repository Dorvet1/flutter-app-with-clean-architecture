class ViaCepAdress {
  String? uf;
  String? city;
  String? adress;
  String? cep;
  String? neighborhood;

  ViaCepAdress(this.uf, this.city, this.adress, this.cep, this.neighborhood);

  ViaCepAdress.fromJson(Map<String, dynamic> json) {
    this.uf = json['uf'];
    this.city = json['localidade'];
    this.adress = json['logradouro'];
    this.cep = json['cep'];
    this.neighborhood = json['bairro'];
  }
}
