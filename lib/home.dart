import 'dart:math';

import 'package:cinema/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'history.dart';
import 'lister.dart';
import 'item.dart';

class HomePage extends StatefulWidget{
  late Client client;
  HomePage({super.key,required this.client});
  @override
  State<HomePage> createState()=>_HomePage();
}
class _HomePage extends State<HomePage>{
  late Cart cart = Cart(isDone: false);
  @override
  Widget build(BuildContext context){
    if(widget.client.list_cart.length ==0){
      cart.id = 1;
    }
    else{
      int counter = 1;
      for(var i in widget.client.list_cart){
        cart.id = max(i.id as int,counter)+1;
      }
    }
    widget.client.list_cart.add(cart);
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child:Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Welcome',
                              style: TextStyle(
                              color: CupertinoColors.systemGrey2,
                              ),
                            ),
                            Text(list_client[0].name as String,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                            )
                          ],
                    )
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(cart: cart),));
                          },
                          icon: const Icon(Icons.shopping_cart)
                      ),
                      IconButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => ProfilePage(client: list_client[0]),)
                            );
                          },
                          icon: const Icon(Icons.person)
                      ),
                    ],
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height/5.7,
                    margin:const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(15)
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width/8,
                        MediaQuery.of(context).size.height/20,
                        MediaQuery.of(context).size.width/8,
                        MediaQuery.of(context).size.height/20),
                    child: Row(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Loyalty card'),
                        Text('4/8'),// Counter of order
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width/8,
                        MediaQuery.of(context).size.height/12,
                        MediaQuery.of(context).size.width/8,
                        MediaQuery.of(context).size.height/20),
                    height: MediaQuery.of(context).size.height/10,
                    width: MediaQuery.of(context).size.width/1.3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.coffee),
                        Icon(Icons.coffee),
                        Icon(Icons.coffee),
                        Icon(Icons.coffee),
                        Icon(Icons.coffee),
                        Icon(Icons.coffee),
                        Icon(Icons.coffee),
                        Icon(Icons.coffee)
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      )
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                          alignment: Alignment.centerLeft,
                          child: const Text('Choose you coffee',style: TextStyle(fontSize: 25,color: Colors.white),),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/2.3,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                              child: GridView.builder(
                                itemCount: list_drinks.length,
                                shrinkWrap: true,
                                physics: AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                  width: 100,
                                  height: MediaQuery.of(context).size.height/9,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: MediaQuery.of(context).size.height/8,
                                        width: MediaQuery.of(context).size.height/6.5,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage(list_drinks[index].image),fit: BoxFit.cover)
                                        ),
                                        margin: const EdgeInsets.fromLTRB(0, 10, 0,0),
                                      ),
                                      Container(
                                        child: TextButton(
                                          child: Text(list_drinks[index].name as String),
                                          onPressed: (){
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => OptionPage(drink: list_drinks[index],cart: cart),)
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                              ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              MediaQuery.of(context).size.width/20,
                              20,
                              MediaQuery.of(context).size.width/20,
                              50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(onPressed: (){}, icon: const Icon(Icons.home)),
                              IconButton(onPressed: (){}, icon: const Icon(Icons.card_giftcard)),
                              IconButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryPage(client: widget.client,),));
                              }, icon: const Icon(Icons.bookmark_border)),
                            ],
                          )
                        )
                      ],
                    ),
                  )
              )
            ],
          )
      ),
    );
  }
}