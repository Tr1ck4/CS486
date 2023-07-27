import 'package:flutter/material.dart';
import 'after order.dart';
import 'lister.dart';

class CartPage extends StatefulWidget{
  late Cart cart ;
  late Client client;
  CartPage({super.key,required this.cart,required this.client});
  @override
  State<CartPage> createState()=>_CartPage();
}
class _CartPage extends State<CartPage>{
  late int shot = 0;
  late int temp =0;
  late int size =0;
  late int ice =0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(onPressed: (){
                Navigator.pop(context);
              },color: Colors.black,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                height: 40,
                child: const Text('My Cart',style: TextStyle(fontSize: 25),),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height/1.4,
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.cart.list_contains.length,
                    itemBuilder: (context, index){
                      shot = (widget.cart.list_contains[index].type / 1000).round();
                      temp = (widget.cart.list_contains[index].type / 100 - shot*10).round();
                      size = (widget.cart.list_contains[index].type / 10 - temp*10 - shot*100).round();
                      ice =  (widget.cart.list_contains[index].type / 1 - size*10 - temp*100-shot*1000).round();
                      return Dismissible(
                          background: Container(color: Colors.red,child:Icon(Icons.cancel)),
                          key: ObjectKey(widget.cart.list_contains[index]),
                          onDismissed: (direction) {
                            setState(() {
                              widget.cart.list_contains.removeAt(index);
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            height: MediaQuery.of(context).size.height/8,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(247, 248, 251, 50),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  width: MediaQuery.of(context).size.height/12,
                                  height: MediaQuery.of(context).size.height/12,
                                  child: Image(image: AssetImage(widget.cart.list_contains[index].drink.image),fit: BoxFit.cover,),// image item
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  width: MediaQuery.of(context).size.height/4.5,
                                  height: MediaQuery.of(context).size.height/12,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(widget.cart.list_contains[index].drink.name as String),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          if(shot == 1)const Text('Single'),
                                          if(shot == 2)const Text('Double'),
                                          const Text('|'),
                                          if(temp == 1)const Text('Hot'),
                                          if(temp == 2)const Text('Cold'),
                                          const Text('|'),
                                          if(size == 1)const Text('Small'),
                                          if(size == 2)const Text('Medium'),
                                          if(size == 3)const Text('Large'),
                                          const Text('|'),
                                          if(ice == 1)const Text('30%'),
                                          if(ice == 2)const Text('50%'),
                                          if(ice == 3)const Text('70%'),
                                        ],
                                      ),
                                      Text('x${widget.cart.list_contains[index].drink.counter}'),
                                    ],
                                  ),
                                ),
                                Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.height/15,
                                    height: MediaQuery.of(context).size.height/12,
                                    child: Text('\$${widget.cart.list_contains[index].drink.calculateTotal(size,shot)}',style: const TextStyle(fontSize: 25),)//item mon
                                ),
                              ],
                            ),
                          )
                      );
                    }
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(padding: const EdgeInsets.symmetric(vertical: 10),
                    child: FilledButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-40,MediaQuery.of(context).size.height/15))
                      ),
                      onPressed: (){
                        setState(() {
                          if(widget.cart.list_contains.isNotEmpty){
                            DateTime now = DateTime.now();
                            for(var i in widget.cart.list_contains){
                              if(i.drink.price >0){
                                widget.client.points+=i.drink.point;
                              }
                            }
                            widget.cart.time = "${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString().padLeft(2,'0')}-${now.minute.toString().padLeft(2,'0')}";
                            widget.client.list_cart.add(widget.cart);
                            widget.client.loyalty += widget.cart.list_contains.length;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DonePage(client: widget.client,),));
                            widget.cart = Cart(isDone: false);
                          }
                        });
                      },
                      child:  Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.shopping_cart),
                          Text('Checkout - \$${widget.cart.calCart()}',style: const TextStyle(fontSize: 20),),
                        ],
                      )
                    ),
                  )
                )
              )
            ]
          )
      ),
    );
  }
}