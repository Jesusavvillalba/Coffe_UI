import "package:flutter/material.dart";

class CoffeTile extends StatelessWidget {
  const CoffeTile(
      {super.key,
      required this.coffeeImagePath,
      required this.coffeeName,
      required this.coffePrice,
      required this.coffeDescription});

  final String coffeeImagePath;
  final String coffeeName;
  final String coffePrice;
  final String coffeDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
        padding: EdgeInsets.all(12.5),
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.5), color: Colors.black54),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 90,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.5),
                  child: Image.asset(
                    coffeeImagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.5, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeName,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  Text(
                    coffeDescription,
                    style: TextStyle(color: Colors.grey.shade700),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$' + coffePrice),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(Icons.add),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
