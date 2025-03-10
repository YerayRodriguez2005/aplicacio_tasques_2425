import 'package:aplicacio_tasques_2425/components/dialogo_nuevo_trabajo.dart';
import 'package:aplicacio_tasques_2425/components/item_tasca.dart';
import 'package:flutter/material.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  List trabajosLista = [
    {"titulo": "Trabajo 1", "valor": false},
    {"titulo": "Trabajo 2", "valor": true},
    {"titulo": "Trabajo 3", "valor": false},
  ];
  TextEditingController tecTtextoTrabajo = TextEditingController();
  void accioGuardar() {
    setState(() {
      trabajosLista.add({"titulo": tecTtextoTrabajo.text, "valor": false},);
    });
    accioCancelar();
  }
  void accioCancelar() {
    Navigator.of(context).pop();
    tecTtextoTrabajo.clear();
  }

  void cambiaCheckbox(bool valorCheckbox, int posLista) {
    setState(() {
      trabajosLista[posLista]["valor"] = !trabajosLista[posLista]["valor"];
    });
  }

  void accionBorrarTrabajo(int posLista) {
    setState(() {
      trabajosLista.removeAt(posLista);
    });
  }

  void crearNuevoTrabajo() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogNuevoTrabajo(
            tecTtextoTrabajo: tecTtextoTrabajo,
            accionguardar: accioGuardar,
            accioncancelar: accioCancelar,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],

      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("App Trabajos"),
        foregroundColor: Colors.orange[200],
      ),

      //FloatingActionButton
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal[300],
        shape: const CircleBorder(),
        onPressed: crearNuevoTrabajo,
        child: Icon(
          Icons.add,
          color: Colors.orange[200],
        ),
      ),

      //Body
      body: ListView.builder(
          itemCount: trabajosLista.length,
          itemBuilder: (context, index) {
            return ItemTrabajo(
              textoTrabajo: trabajosLista[index]["titulo"],
              valorCheckbox: trabajosLista[index]["valor"],
              cambiaValorCheckbox: (valor) =>
                  cambiaCheckbox(trabajosLista[index]["valor"], index),
              borraTrabajo: (valor) => accionBorrarTrabajo(index),
            );
          }),
    );
  }
}
