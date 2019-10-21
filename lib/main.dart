import 'package:flutter/material.dart';

main()=>runApp(Estacionamiento());

class Estacionamiento extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Cobrar();
  }
}

class Cobrar extends State{

double costohora;
double fraccion;
double horainicio;
double minutinicio;
double horafinal;
double minutfinal;
double pagar=0.0;
double minutosiniciales;
double minutosfinales;
double minutostotales;
double costofraccion;
double completar;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: 
      Scaffold(
        appBar: AppBar(
          title: Text('Estafacionamiento'),
        ),
        body:
        ListView(
          children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: 
          Column(
            children: <Widget>[
              Text('Primera Hora'),
              TextField(
                onChanged: (cambio){
                  print(cambio);
                  setState(() {
                    costohora=double.parse(cambio);
                  });

                },
                decoration: 
                InputDecoration(
                  labelText: 'Costo Primera Hora',
                  hintText: 'Escribe el costo de la primer hora',
                  helperText: 'Sin caracteres especiales',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
              Text('Fracción'),
              TextField(
                onChanged: (cambio){
                  print(cambio);
                  setState(() {
                   fraccion=double.parse(cambio);
                  });

                },
                decoration: 
                InputDecoration(
                  labelText: 'Costo por Fracción',
                  hintText: 'Escribe el costo por Fracción',
                  helperText: 'Sin caracteres especiales',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
              Text('Hora y Minutos de Entrada'),
              Row(children: <Widget>[
                Expanded(
                  child: 
                  TextField(
                onChanged: (cambio){
                  print(cambio);
                  setState(() {
                    horainicio=double.parse(cambio);

                  });

                },
                decoration: 
                InputDecoration(
                  labelText: 'Hora Inicio',
                  hintText: 'Hora',
                  helperText: 'Formato de',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            ),
            Expanded(
              child:
              TextField(
                onChanged: (cambio){
                  print(cambio);
                  setState(() {
                   minutinicio=double.parse(cambio); 
                   minutosiniciales= horainicio*60+minutinicio;
                  });

                },
                decoration: 
                InputDecoration(
                  labelText: 'Minutos Inicio',
                  hintText: 'Minutos',
                  helperText: '24 horas',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ), 
            )    
               ],
              ),
              Text('Hora y Minutos de Salida'),
              Row(children: <Widget>[
                Expanded(
                  child: 
                  TextField(
                onChanged: (cambio){
                  print(cambio);
                  setState(() {
                   horafinal=double.parse(cambio); 
                  });

                },
                decoration: 
                InputDecoration(
                  labelText: 'Hora Salida',
                  hintText: 'Hora',
                  helperText: 'Formato de',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            ),
            Expanded(
              child:
              TextField(
                onChanged: (cambio){
                  print(cambio);
                  setState(() {
                   minutfinal=double.parse(cambio); 
                   minutosfinales= horafinal*60+minutfinal;
                   minutostotales= minutosfinales-minutosiniciales;
                   if (minutostotales<60){
                     pagar=costohora;
                   }
                   else{
                      costofraccion = (minutostotales-60) / 15;
                      pagar = costofraccion + costohora;

                   }

                  });

                },
                decoration: 
                InputDecoration(
                  labelText: 'Minutos Salida',
                  hintText: 'Minutos',
                  helperText: '24 Horas',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ), 
            )    
               ],
              ),
        
              Text('Costo hora: $pagar')
            ],
          ),
        ),
          ]
      ),
      )
    );
  }
}