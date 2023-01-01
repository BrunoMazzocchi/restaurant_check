import 'package:flutter/material.dart';

class OrderDone extends StatefulWidget {
  final Future<int> statusCode;
  const OrderDone({Key? key, required this.statusCode}) : super(key: key);

  @override
  State<OrderDone> createState() => _OrderDoneState();
}

class _OrderDoneState extends State<OrderDone> {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<int>(
            future: widget.statusCode,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.only(top: height * 0.1, left: width * 0.1, right: width * 0.1),
                  height: height,
                  width: width,
                  child: Column(
                    children:  [
                      const Text(
                        'Order Placed Successfully',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    const  SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Order ID: ${snapshot.data}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                   const    SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child:const  Text('Go Back'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('You should receive more information in your active orders',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),

    );
  }
}
