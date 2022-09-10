import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/text_field_button.dart';


class feedbackScreen extends StatefulWidget {
  final String title;

  const feedbackScreen({
    required this.title,
  });

  @override
  _feedbackScreenState createState() => _feedbackScreenState();
}

class _feedbackScreenState extends State<feedbackScreen> {
  final formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
                              prefs.setBool('onboarding', false);
            }, icon: Icon(Icons.logout)),
          ],
          title: Text(widget.title),
        ),
        body: Form(
          key: formKey,
          //autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
              buildUsername(),
              const SizedBox(height: 16),
              buildCourse(),
              const SizedBox(height: 32),
              buildFeedback(),
              const SizedBox(height: 32),
              buildSubmit(),
            ],
          ),
        ),
        
      );

  Widget buildUsername() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder(),
          // errorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // focusedErrorBorder:
          //     OutlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
          // errorStyle: TextStyle(color: Colors.purple),
        ),
        validator: (value) {
          if (value!.length < 4) {
            return 'Enter at least 4 characters';
          } else {
            return null;
          }
        },
        maxLength: 30,
        onSaved: (value) => setState(() => username = value!),
      );

  Widget buildCourse() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Course',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 2) {
            return 'Password must be at least 7 characters long';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => email = value!),
      );

  Widget buildFeedback() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Feedback',
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value!.length < 7) {
            return 'Password must be at least 7 characters long';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => password = value!),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      );

  Widget buildSubmit() => Builder(
        builder: (context) => ButtonWidget(
          text: 'Submit',
          onClicked: () {
            final isValid = formKey.currentState!.validate();
            // FocusScope.of(context).unfocus();

            if (isValid) {
              formKey.currentState!.save();

              final message =
                  'Username: $username\nPassword: $password\nEmail: $email';
              final snackBar = SnackBar(
                content: Text(
                  message,
                  style: TextStyle(fontSize: 20),
                ),
                backgroundColor: Colors.green,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      );
}