import 'package:flutter/material.dart';
import 'activity_model.dart';

class ActivityForm extends StatefulWidget {
  final Function(ActivityModel) onSave;

  const ActivityForm({super.key, required this.onSave});

  @override
  State<ActivityForm> createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final _formKey = GlobalKey<FormState>();
  final _typeController = TextEditingController();
  final _co2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Registrar Actividad"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _typeController,
              decoration: const InputDecoration(labelText: "Tipo de actividad"),
              validator: (value) =>
                  value == null || value.isEmpty ? "Ingrese un tipo" : null,
            ),
            TextFormField(
              controller: _co2Controller,
              decoration: const InputDecoration(labelText: "CO₂ (kg)"),
              keyboardType: TextInputType.number,
              validator: (value) =>
                  value == null || double.tryParse(value) == null
                  ? "Ingrese un valor válido"
                  : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancelar"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final activity = ActivityModel(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                type: _typeController.text,
                co2Kg: double.parse(_co2Controller.text),
                date: DateTime.now(),
              );
              widget.onSave(activity);
              Navigator.pop(context);
            }
          },
          child: const Text("Guardar"),
        ),
      ],
    );
  }
}
