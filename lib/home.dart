import 'dart:math';
import 'package:cinema/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'rewards.dart';
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
  List<Widget> ls = [];
  @override
  void initState(){
    super.initState();
    if(widget.client.list_cart.isEmpty){
      cart.id = 1;
    }
    else{
      int counter = 1;
      for(var i in widget.client.list_cart){
        cart.id = max(i.id as int,counter)+1;
      }
    }
    if(widget.client.loyalty ==8){
      widget.client.points +=500;
    }
    for(int i = 0 ; i < widget.client.loyalty;i++){
      ls.add(const Icon(Icons.coffee,color: Colors.black,));
    }
    for(int i = 0 ; i < 8-widget.client.loyalty;i++){
      ls.add(const Icon(Icons.coffee,color: Colors.grey,));
    }
  }
  @override
  Widget build(BuildContext context){
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
                            Text(widget.client.name as String,
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
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(cart: cart,client: widget.client,),));
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
                      children: [
                        const Text('Loyalty card'),
                        Text('${widget.client.loyalty}/8'),// Counter of order
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
                      children: ls
                    ),
                  )
                ],
              ),
              Expanded(
                  child: Container(
                    height: double.maxFinite,
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
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) => Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
                                        width: MediaQuery.of(context).size.height/6,
                                        margin: const EdgeInsets.fromLTRB(0, 10, 0,0),
                                        child: IconButton(
                                          onPressed: (){
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => OptionPage(drink: list_drinks[index],cart: cart,client: widget.client,),)
                                            );
                                          },
                                          icon: Image(image:AssetImage(list_drinks[index].image)),
                                        ),
                                      ),
                                      TextButton(
                                        child: Text(list_drinks[index].name as String),
                                        onPressed: (){
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) => OptionPage(drink: list_drinks[index],cart: cart,client: widget.client,),)
                                          );
                                        },
                                      )
                                    ],
                                  ),
                              ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                          )
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              margin: EdgeInsets.fromLTRB(
                                  MediaQuery.of(context).size.width/20,
                                  20,
                                  MediaQuery.of(context).size.width/20,
                                  50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: const [BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 4,
                                    offset: Offset(4,8),
                                  )]
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.home)),
                                  IconButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RewardPage(client: widget.client,cart: cart,),));
                                  }, icon: const Icon(Icons.card_giftcard)),
                                  IconButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryPage(),));
                                  }, icon: const Icon(Icons.bookmark_border)),
                                ],
                              )
                          ),
                        )

                      ]
                  )
                  )
              ),

          ])
      ),
    );
  }
}