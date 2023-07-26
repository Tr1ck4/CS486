import 'package:flutter/material.dart';
import 'history.dart';
import 'lister.dart';
class DonePage extends StatelessWidget{
  final Client client;
  const DonePage({super.key,required this.client});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height/3, 0, 30),
                  height: 200,
                  child: const Icon(Icons.wallet_giftcard_outlined,size: 200),//change icon
                ),
                const Text('Order Success',style: TextStyle(fontSize: 30),),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text('Your order has been placed successfully\nFor more details, go to my orders',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child:FilledButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage(),));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height/20,
                      width: MediaQuery.of(context).size.width-100,
                      alignment: Alignment.center,
                      child: const Text('Track My Orders',textAlign: TextAlign.center,),
                    ),
                  )
                )
              ],
            ),
          )
      )
    );
  }
}