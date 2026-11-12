
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// Funció principal que inicia l'aplicació.
void main() {
  runApp(const MyApp());
}

/// Classe principal de l'aplicació.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Construeix la pantalla inicial de l'aplicació.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulari C',
      home: const MyHomePage(),
    );
  }
}

/// Classe que crea la pantalla del formulari.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  /// Crea l'estat de la pantalla.
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// Classe que controla el funcionament del formulari.
class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormBuilderState>();

  /// Construeix tots els elements del formulari.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pol Torras Claverol Form C'),
        backgroundColor: Colors.lightBlue[200],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderChoiceChip<String>(
                name: 'sistema',
                decoration: const InputDecoration(
                  labelText: 'Choice Chips',
                ),
                options: const [
                  FormBuilderChipOption(value: 'Flutter'),
                  FormBuilderChipOption(value: 'Android'),
                  FormBuilderChipOption(value: 'Chrome OS'),
                ],
              ),
              const SizedBox(height: 20),

              FormBuilderSwitch(
                name: 'switch',
                title: const Text('This is a switch'),
                initialValue: false,
              ),
              const SizedBox(height: 20),

              FormBuilderTextField(
                name: 'text',
                decoration: const InputDecoration(
                  labelText: 'Text Field',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length < 2) {
                    return 'Escriu com a mínim 2 caràcters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              FormBuilderDropdown<String>(
                name: 'dropdown',
                decoration: const InputDecoration(
                  labelText: 'Dropdown Field',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                    value: 'Opció 1',
                    child: Text('Opció 1'),
                  ),
                  DropdownMenuItem(
                    value: 'Opció 2',
                    child: Text('Opció 2'),
                  ),
                  DropdownMenuItem(
                    value: 'Opció 3',
                    child: Text('Opció 3'),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              FormBuilderRadioGroup<String>(
                name: 'radio',
                decoration: const InputDecoration(
                  labelText: 'Radio Group Model',
                  border: OutlineInputBorder(),
                ),
                options: const [
                  FormBuilderFieldOption(value: 'Option 1'),
                  FormBuilderFieldOption(value: 'Option 2'),
                  FormBuilderFieldOption(value: 'Option 3'),
                  FormBuilderFieldOption(value: 'Option 4'),
                ],
              ),
              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    final dades = _formKey.currentState!.value;

                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Formulari enviat'),
                          content: Text(dades.toString()),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Tancar'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
