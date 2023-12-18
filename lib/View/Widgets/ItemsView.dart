import 'package:flutter/material.dart';


class CustomItems extends StatelessWidget {
  String? image;
  String? offer;
  String? bestSeller;
  String? dealOfTheDay;
  String? name;
   CustomItems({super.key, this.image,this.bestSeller,this.dealOfTheDay,this.name,this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.grey,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    '$image',
                    width: double.infinity,
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
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
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            color: Colors.red,
                            child: Text(
                              '$offer',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),const SizedBox(width: 8,),
                          const Expanded(
                            child: Text(
                              'Deal of the Day',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        child: Text(
                          '$name ',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

