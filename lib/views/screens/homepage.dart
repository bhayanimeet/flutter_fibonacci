import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double id = 0;
  int first = 0;
  int second = 1;
  int next = 0;
  int c = 0;
  List fibonacci = [0, 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fibonacci series",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo.shade400,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Slider(
              min: 0,
              max: 20,
              divisions: 20,
              label: '${id.toInt()}',
              value: id,
              onChanged: (val) {
                setState(() {
                  id = val;
                  for (c = 0; c < id; c++) {
                    if (c <= 1) {
                      next = c;
                    } else {
                      next = first + second;
                      first = second;
                      second = next;
                      fibonacci.add(next);
                    }
                  }
                });
              },
            ),
          ),
          Expanded(
            flex: 10,
            child: ListView.builder(
              itemCount: id.toInt(),
              itemBuilder: (context, i) => Card(
                elevation: 3,
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text("${fibonacci[i]}"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
