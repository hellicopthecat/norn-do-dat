import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: FormWidget(title: "hello")),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({super.key, required this.title});
  final String title;
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _key = GlobalKey<FormState>();
  final textController = TextEditingController();

  void btnClick() {
    print(textController.text);
    setState(() {});
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.title),
        Text(textController.text),
        Form(
          key: _key,
          child: TextFormField(
            controller: textController,
            decoration: InputDecoration(hintText: "Input Your Text"),
          ),
        ),
        TextButton(onPressed: btnClick, child: Text("Click")),
      ],
    );
  }
}
