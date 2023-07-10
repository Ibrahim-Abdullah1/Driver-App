import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class drivermain extends StatelessWidget {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form.
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Driver Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  name: 'Date',
                  decoration: InputDecoration(labelText: 'Date'),
                ),
                FormBuilderTextField(
                  name: 'DriverName',
                  decoration: InputDecoration(labelText: 'Driver Name'),
                ),
                FormBuilderTextField(
                  name: 'DriverPno',
                  decoration: InputDecoration(labelText: 'Driver Phone Number'),
                ),
                FormBuilderTextField(
                  name: 'ProductID',
                  decoration: InputDecoration(labelText: 'Product ID'),
                ),
                FormBuilderTextField(
                  name: 'ProductName',
                  decoration: InputDecoration(labelText: 'Product Name'),
                ),
                FormBuilderTextField(
                  name: 'Qty',
                  decoration: InputDecoration(labelText: 'Quantity'),
                ),
                FormBuilderTextField(
                  name: 'Status',
                  decoration: InputDecoration(labelText: 'Status'),
                ),
                FormBuilderTextField(
                  name: 'Time',
                  decoration: InputDecoration(labelText: 'Time'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () async {
                    if (_formKey.currentState!.saveAndValidate()) {
                      print(_formKey.currentState!.value);
                      await FirebaseFirestore.instance
                          .collection('demands')
                          .add(_formKey.currentState!.value);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
