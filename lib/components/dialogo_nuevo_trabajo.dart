import 'package:aplicacio_tasques_2425/components/boton_dialogo.dart';
import 'package:flutter/material.dart';

class DialogNuevoTrabajo extends StatelessWidget {
  final TextEditingController tecTtextoTrabajo;
  final Function()? accionguardar;
  final Function()? accioncancelar;

  const DialogNuevoTrabajo(
      {super.key,
      required this.accioncancelar,
      required this.accionguardar,
      required this.tecTtextoTrabajo});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      content: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: tecTtextoTrabajo,
              cursorColor: Colors.orange,
              decoration: InputDecoration(
                hintText: "Escriu la tasca...",
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.teal[100],
              ),
            ),
            //SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BotonDialog(
                    textoBoton: "Guardar", accionBoton: accionguardar), //Boton guardar
                BotonDialog(
                    textoBoton: "Cancelar",
                    accionBoton: accioncancelar), //Boton cancelar
              ],
            ),
          ],
        ),
      ),
    );
  }
}
