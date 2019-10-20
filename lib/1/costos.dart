import 'package:estacionamiento/1/date_time_picker_widget21.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


bool enabled = false;


class Costos extends StatefulWidget {
  @override
  _CostosState createState() => _CostosState();
}

class _CostosState extends State<Costos> {
 
 

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          
              
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  icon: Icon(Icons.accessibility),
                  labelText: 'Costo primera hora',
                  hintText: 'Escribe el costo',
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
                      onChanged: (cambio) {
                      setState(() {
                        
                        if(cambio !='') {
                        enabled = true ;
                        precio_hora = (cambio);
                        } else if (cambio == '') {enabled = false; precio_hora='0';}
                      });
                
              },
      
              
            ),
            Text('${int.parse(precio_hora)}'),
             
      
          TextField(
              keyboardType: TextInputType.number,
              enabled: enabled,
              decoration: InputDecoration(
                  icon: Icon(Icons.accessibility),
                  labelText: 'Costo por fraccion',
                  hintText: 'Escribe el costo',
                  
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
              onChanged: (cambio1) {
                setState(() {
                  precio_cuarto = cambio1;
                  
                });
                
                
              },
            ),
      
    
            Text('$precio_cuarto')
        
      ],
      
    );
  }
}
