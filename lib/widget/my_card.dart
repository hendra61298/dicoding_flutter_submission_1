import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String text;
  final String number;
  const MyCard({
    Key? key,
    required this.text,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape:  const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        elevation: 2,
        margin: const EdgeInsets.all(1.0),
        child: SizedBox(
          width: 256,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize:MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15,left: 30),
                      child: Text(
                        text,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15,right: 30),
                      child: CircleAvatar(
                        backgroundColor: Colors.lightGreen[100],
                        radius: 20,
                        child: const Icon(
                          Icons.analytics_sharp,
                          color: Colors.lightGreen,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 25, left: 25,bottom: 10),
                      child:   Text(
                        "Rp $number",
                        style: const TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 30),

                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
