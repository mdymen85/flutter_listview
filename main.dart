import 'dart:convert';
import 'package:bolao_flutter/API.dart';
import 'package:bolao_flutter/models/User.dart';
import 'package:bolao_flutter/models/Partido.dart';
import 'package:bolao_flutter/servicios/servicioCampeonato.dart';
import 'package:bolao_flutter/servicios/servicioPartido.dart';
import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Http App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyListScreen(),
    );
  }
}

class MyListScreen extends StatefulWidget {
  @override
  State createState() => _MyListScreenState();
}


class _MyListScreenState extends State<MyListScreen> {
  var users = new List<User>();
  var partidos = new List<Partido>();

  _getPartidos() {
    ServicioPartido.getBasic().then((response) {
      var res = json.decode(response.body);
      var it = res["body"];
      print(res["body"]);
      
      Iterable list = it;
      this.partidos = list.map((model) => Partido.fromJson(model)).toList();
    });
  }

palpitar() {
  print(this.partidos[0].goles1);
  print(this.partidos[0].goles2);
  print(this.partidos[1].goles1);
  print(this.partidos[1].goles2);


}

  @override
  initState() {
    super.initState();
    //_getUsers();
    _getPartidos();
  }

  dispose() {
    super.dispose();
  }


  Widget build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Partidos"),          
        ),
        body: 
          Column (
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded (
                child: ListView.builder(
                  itemCount: partidos.length,
                  itemBuilder: (context, index) {
                    return card2(context, index);
                  }
                ),
              ),
              MaterialButton( 
                child:Text("palpitar"),
                onPressed: () {
                  setState(() {
                    palpitar();
                  });
                }
              )
            ],
          )     
        );
  }

  Widget card2(context, index) {
    return Card (
      margin: EdgeInsets.all(8.0),
      child: filaDePartido(context, index)
      );
      
  } 

  Widget filaDePartido(context, index) {
    return Column (
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
          Text(partidos[index].fecha),
          Flexible(
            child:Row (
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[            
                  CircleAvatar(backgroundImage: NetworkImage("http://www.bolaocraquedebola.com.br/assets/equipos/grande/" + partidos[index].logo1)),
                  Container (
                      padding : EdgeInsets.only(left: 10.0, right: 10),
                      child: SizedBox(
                        width: 130,
                        child:Text(partidos[index].equipo1),    
                      )                
                  ),
                  Container (      
                    child: Expanded (
                      child: TextField( 
                        decoration: InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder()
                        ),
                        maxLength: 2,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          partidos[index].goles1 = int.parse(text);
                        }
                      ),
                    )
                  ), 
                  Expanded (child: Container(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  )
                ]
            )
          ),
          Flexible (
            child:Row (
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[            
                CircleAvatar(backgroundImage: NetworkImage("http://www.bolaocraquedebola.com.br/assets/equipos/grande/" + partidos[index].logo2)),
                Container (
                    padding : EdgeInsets.only(left: 10.0, right: 10),
                    child: SizedBox(
                      width: 130,
                      child:Text(partidos[index].equipo2),    
                    )
                    
                  ),
                Container (      
                  child: Expanded (
                    child: TextField( 
                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder()
                      ),
                      maxLength: 2,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      onChanged: (text) {
                        partidos[index].goles2 = int.parse(text);
                      }
                    ),
                  )
                ), 
              Expanded (
                child: Container(              
                  padding: EdgeInsets.only(left: 10),
                ),
              )
            ]
          )
        )

      ],
    );

  }

}
