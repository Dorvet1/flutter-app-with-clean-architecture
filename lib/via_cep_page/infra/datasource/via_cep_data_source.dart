import 'package:appviacep/via_cep_page/domain/entities/via_cep_details.dart';

abstract class ViaCepDataSource{
  Future<ViaCepAdress> fetchAdress(String cep);
}