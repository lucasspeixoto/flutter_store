import 'package:flutter/material.dart';
import 'package:furniture_store/models/cart_item.dart';
import 'package:furniture_store/screens/cart.dart';
import 'package:furniture_store/widgets/app_bar.dart';
import 'package:furniture_store/widgets/grid_products.dart';

import 'colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/cart': (context) => const Cart(),
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline4: TextStyle(
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          headline5: TextStyle(
            fontSize: 20,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
        ),
        primarySwatch: ColorsPallete().samplePurple,
      ),
      home: const Start(),
    );
  }
}

class Start extends StatefulWidget {
  static List<CartItem> cartItems = [];

  const Start({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StartState();
  }
}

class _StartState extends State<Start> {
  final List<Map<String, Object>> _furnitures = [
    {
      "title": "Mesa",
      "price": 300,
      "photo": "furniture1.jpeg",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "title": "Cadeira",
      "price": 120,
      "photo": "furniture2.jpg",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "title": "Manta",
      "price": 200,
      "photo": "furniture3.jpg",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "title": "Sofá Cinza",
      "price": 800,
      "photo": "furniture4.jpg",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "title": "Mesa de cabeceira",
      "price": 400,
      "photo": "furniture5.jpg",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "title": "Jogo de Cama",
      "price": 250,
      "photo": "furniture6.jpg",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    },
    {
      "title": "Sofá Branco",
      "price": 900,
      "photo": "furniture7.jpg",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean aliquam libero id mauris mollis convallis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const CustomAppBar(
        title: 'Inicio',
        isCartScreen: false,
      ),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 30,
                    right: 20,
                    bottom: 10,
                  ),
                  child: const Divider(),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: const Text('Lista de Produtos'),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 30,
                    bottom: 10,
                  ),
                  child: const Divider(),
                ),
              ),
            ],
          ),
          Flexible(
              child: GridProducts(
            updateCart: updateCart,
            furnitures: _furnitures,
          ))
        ],
      ),
    );
  }

  void updateCart() {
    setState(() {});
  }
}
