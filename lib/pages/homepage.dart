import 'package:coffe_app/util/coffee_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.menu),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
      ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Find the best cofee for you',
              style: GoogleFonts.bebasNeue(fontSize: 60),
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee...',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600))),
            ),
          ),
          SizedBox(height: 25.0),
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (Context, index) {
                return Coffe_Type(
                  coffeeType: coffeeType[index][0],
                  isSelected: coffeeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeTile(
                coffeeImagePath: 'assets/coffe (1).jpg',
                coffePrice: '4.00',
                coffeeName: 'Cappucino',
                coffeDescription: 'with Almond Milk',
              ),
              CoffeTile(
                coffeeImagePath: 'assets/coffe (2).jpg',
                coffePrice: '4.20',
                coffeeName: 'Latte',
                coffeDescription: 'with Almond Milk',
              ),
              CoffeTile(
                coffeeImagePath: 'assets/coffe (3).jpg',
                coffePrice: '3.00',
                coffeeName: 'Black',
                coffeDescription: 'with Almond Milk',
              ),
              CoffeTile(
                coffeeImagePath: 'assets/coffe (4).jpg',
                coffePrice: '6.00',
                coffeeName: 'Milk on Coffee',
                coffeDescription: 'with Almond Milk',
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class Coffe_Type extends StatelessWidget {
  const Coffe_Type({
    super.key,
    required this.coffeeType,
    required this.isSelected,
    required this.onTap,
  });
  final String coffeeType;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
          coffeeType,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.red : Colors.black26),
        ),
      ),
    );
  }
}
