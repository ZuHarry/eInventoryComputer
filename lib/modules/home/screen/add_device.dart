import 'package:flutter/material.dart';

class AddDevicePage extends StatefulWidget {
  const AddDevicePage({super.key});

  @override
  State<AddDevicePage> createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _macController = TextEditingController();

  String _deviceType = 'PC';

  Color hex(String hexCode) => Color(int.parse('FF$hexCode', radix: 16));

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      String ip = _ipController.text;
      String mac = _macController.text;

      // You can send this data to your database or print it
      print('Device Name: $name');
      print('Type: $_deviceType');
      print('IP: $ip');
      print('MAC: $mac');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Device Added Successfully")),
      );

      // Clear form
      _nameController.clear();
      _ipController.clear();
      _macController.clear();
      setState(() {
        _deviceType = 'PC';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: hex('7BAFBB'),
      appBar: AppBar(
        backgroundColor: hex('7BAFBB'),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Add New Device', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Device Name'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter device name' : null,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: _deviceType,
                    items: ['PC', 'Peripheral']
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _deviceType = value!;
                      });
                    },
                    decoration: const InputDecoration(labelText: 'Device Type'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _ipController,
                    decoration: const InputDecoration(labelText: 'IP Address'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter IP address' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _macController,
                    decoration: const InputDecoration(labelText: 'MAC Address'),
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter MAC address' : null,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: hex('153B6D'),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
