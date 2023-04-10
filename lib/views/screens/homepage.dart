import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double id = 0;
  int min = 0;
  int nextNum = 1;
  int result = 0;
  List myItem = [];
  List numbers = [];

  fibonacci({required double index}){
    if(index<=nextNum) {
      result = min + nextNum;
      numbers.add(result);
      min = nextNum;
      nextNum = result;
      fibonacci(index: id);
    }
    else{
      result = 0;
      min = 0;
      nextNum = 0;
      numbers.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fibonacci series"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.indigo.shade400,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Slider(
                min: 0,
                max: 100,
                value: id,
                onChanged: (val) {
                  setState(() {
                    id = val;
                    fibonacci(index: id);
                    myItem.length++;
                  });
                },
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: myItem.length,
                itemBuilder: (context, i) => ListTile(
                  title: Text("$numbers"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
