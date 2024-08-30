import 'package:dio/dio.dart';
import 'package:instagram/models/characters_model.dart';

class Services {
  /// 1. Backend o un proveedor externo o su base de datos local [x]
  /// 2. Un cliente http -> Dio - http [x]
  /// 3. Implementar el servicio (este archivo) [x]
  /// 4. Consumirlo

  /// Implementar el servicio
  /// 1. Declarar una instancia de Dio [x]
  /// 2. Crear el método [x]

  final dio = Dio();

  /// 2.1. Método debe ser descriptivo
  /// 2.2. Future

  Future<CharactersModel> getAllCharacters() async {
    ///2.2.1 try - catch (manejar errores)
    //try {

    // } catch(err) {

    // }

    ///2.2.2 necesitar el método REST
    ///2.2.3. Imprimir el dato

    try {
      const url = 'https://rickandmortyapi.com/api/character';

      /// Consulta http
      /// 1. Método rest
      /// Como respuesta un response -> dato - códigos - 200, 202
      final response = await dio.get(url);

      /// El json es el response.data
      return CharactersModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (err) {
      print("ERROR_DIO: $err");

      /// throw 'Esto es un error x';
      /// rethrow // retorna el error tal cual lo tienes
      rethrow;
    } catch (err) {
      print("ERROR: $err");
      rethrow;
    }
  }
}
