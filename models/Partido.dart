class Partido {

  BigInt idCampeonato;
  String idPartido;
  String idEquipo1;
  String idEquipo2;
  String fecha;
  int goles1;
  int goles2;
  bool jugado;
  String acumulado;
  BigInt idRodada;
  String campeonato;
  String equipo1;
  String equipo2;
  String sigla1;
  String sigla2;
  String logo1;
  String logo2;

  Partido.fromJson(Map json) {

    this.idCampeonato = json['mt_idchampsionhip'];
    this.idPartido = json['mt_id'];
    this.idEquipo1 = json['mt_idteam1'];
    this.idEquipo2 = json['mt_idteam2'];
    this.fecha = json['mt_date'];
    this.goles1 = json['mt_goal1'];
    this.goles2 = json['mt_goal2'];
    this.jugado = json['mt_played'] == 1 ? true : false;
    this.acumulado = json['mt_acumulado'];
    this.idRodada = json['mt_idRodada'];
    this.campeonato = json['ch_nome'];
    this.equipo1 = json['t1nome'];
    this.equipo2 = json['t2nome'];
    this.sigla1 = json['tm1_sigla'];
    this.sigla2 = json['tm2_sigla'];
    this.logo1 = json['tm1_logo'];
    this.logo2 = json['tm2_logo'];

  }

    Map toJson() {
    return {'equipo1': this.equipo1, 'equipo2': this.equipo2 };
  }

}