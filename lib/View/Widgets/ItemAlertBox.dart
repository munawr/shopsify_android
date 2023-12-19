import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shopsify/Provider/home_screen_provider.dart';

class ItemDetailsDialog extends StatelessWidget {
  final String? name;
  final String? image;
  final String? price;
  final String? bestSeller;

  ItemDetailsDialog({
    required this.name,
    required this.image,
    required this.price,
    required this.bestSeller,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeScreenProvider(),
      child: Consumer<HomeScreenProvider>(
        builder: (context, data, _) {
          return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 430,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF0298b1), Color(0xFF7CD857)],
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                  // AlertDialog Content
                  Center(
                    child: Container(
                      width: 270,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      padding: const EdgeInsets.all(8.0), // Adjust as needed
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {GoRouter.of(context).pop();}, icon: const Icon(Icons.close)),
                            ],
                          ),
                          Stack(
                            children: [
                              Image.network(
                                '$image',
                                width: 300,
                                height: 180.0,
                                fit: BoxFit.cover,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 4.0,
                                        ),
                                        color: const Color(0xFF0298b1),
                                        child: Text(
                                          '$bestSeller',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        icon: const Icon(Icons.favorite),
                                        color: Colors.grey,
                                        onPressed: () {
                                          // Handle like button press
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(name ?? 'N/A',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),),
                          const SizedBox(height: 11,),
                          Container(
                              width: 120,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: const Color(0xE5B6B6B6),
                                  border: Border.all(color: Colors.black)),
                              child: const Center(child: Text("See all Details"))),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              width: 120,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFEA9800),
                                  border: Border.all(color: Colors.black)),
                              child: Center(
                                  child: Text("Price: ${price ?? 'N/A'}"))),
                          GestureDetector(
                            onTap: () {
                              // Add the item to Kart when the button is clicked
                              data.getItems();
                              // data.addToKart(name, image, price, bestSeller);
                              // GoRouter.of(context).pop();
                            },
                            child: Container(
                              width: 140,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xFFEA9800),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(child: Text("Add to Kart")),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Qty:'),
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  data.quantityDecrement();
                                },
                              ),
                              Text(' ${data.quantity}'),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  data.quantityIncrement();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
