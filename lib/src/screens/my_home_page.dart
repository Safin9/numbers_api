import 'package:flutter/material.dart';
import 'package:numbers_api/src/screens/services/num_service.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  NumberService service = NumberService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter a number',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text('send')),
            FutureBuilder<String>(
              future: service.getInfo(
                  numb: controller.value.text == ''
                      ? '1'
                      : controller.value.text),
              builder: (ctx, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.toString());
                }
                return const Text('Loading...');
              },
            )
          ],
        ),
      ),
    );
  }
}
