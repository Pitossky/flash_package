import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

class FlashScreen extends StatefulWidget {
  @override
  FlashScreenState createState() => FlashScreenState();
}

class FlashScreenState extends State<FlashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flash Package'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Show Toast'),
              onPressed: () async {
                showFlash(
                  context: context,
                  builder: (_, controller) {
                    return Flash.dialog(
                      controller: controller,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        height: MediaQuery.of(context).size.height * 0.5,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.35,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Your order has been received!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  controller.dismiss();
                                  Navigator.of(context).pop();
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height *
                                      0.135,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Center(
                                    child: Text(
                                      'Continue Shopping',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            ElevatedButton(
              child: const Text('Show Snackbar'),
              onPressed: () {
                showFlash(
                  context: context,
                  duration: const Duration(seconds: 3),
                  //persistent: false,
                  builder: (_, controller) {
                    return Flash.bar(
                      controller: controller,
                      backgroundGradient: const LinearGradient(
                        colors: [
                          Colors.yellow,
                          Colors.amber,
                        ],
                      ),
                      horizontalDismissDirection:
                          HorizontalDismissDirection.startToEnd,
                      margin: const EdgeInsets.all(8),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                      forwardAnimationCurve: Curves.easeOutBack,
                      reverseAnimationCurve: Curves.slowMiddle,
                      //insetAnimationDuration: const Duration(seconds: 2),
                      child: FlashBar(
                        title: Text('Great Snackbar!',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        content: const Text('This is a snack!'),
                        primaryAction: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: (){},
                        ),
                        showProgressIndicator: true,
                      ),
                    );
                  },
                );
              },
            ),
            ElevatedButton(
              child: const Text('Show Dialog'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      content: const Text('Hello'),
                      actions: [
                        ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Center(child: Text('OK')),
                        )
                      ],
                    ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
