
import 'package:flutter/material.dart';

class Bottomsheet extends StatelessWidget {
  const Bottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    
   
    return Container(
        height: 150.0,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(235, 76, 175, 79),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  fixedSize: const Size(250, 60),
                ),
                child: const Text(
                  'Payment Options',
                  style: TextStyle(fontSize: 15.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.0)),
                      child: Center(
                          child: Text(
                        '',
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      )),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        fixedSize: const Size(150, 60),
                      ),
                      child: const Text(
                        'Proceed',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
