import 'package:flutter/material.dart';
import 'package:foodapp/image_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> foodimage = [
    'assets/baked.png',
    'assets/broccoli.png',
    'assets/classic.png',
    'assets/icecream.png',
    'assets/pancake.png',
    'assets/sushi.png',
    'assets/frozen.png',
    'assets/pizza.png'
  ];
  List<String> names = [
    'Baked Pork',
    'Broccoli',
    'Classic Chili',
    'Ice Cream',
    'Pan Cake',
    'Sushi',
    'Frozen Food',
    'Pizza'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Text(
            'My Food Choices',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        // crossAxisSpacing: 10.0,
        // mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: List.generate(
          foodimage.length,
          (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageDetails(
                        foodname: '${names[index]}',
                        imagpath: '${foodimage[index]}',
                      ),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(2.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          child: Image.asset('${foodimage[index]}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('${names[index]}')],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
