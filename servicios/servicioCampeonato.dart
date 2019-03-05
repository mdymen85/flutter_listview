import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "http://192.168.0.5/penca/public/campeonatos";

class ServicioCampeonato {
  static Future getBasic() {
    var url = baseUrl + "/get/idCampeonato/31/idRodada/460";
    return http.get(url);
  }
}