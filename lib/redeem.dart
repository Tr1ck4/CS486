import 'package:flutter/material.dart';
import 'lister.dart';
class RedeemPage extends StatefulWidget{
  late Client client;
  late Cart cart;
  RedeemPage({super.key,required this.client,required this.cart});
  @override
  State<RedeemPage> createState()=>_RedeemPage();
}

class _RedeemPage extends State<RedeemPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  BackButton(onPressed: (){
                    Navigator.pop(context);
                  },color: Colors.black,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    height: 40,
                    child: const Text('Redeem',style: TextStyle(fontSize: 25),),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    List<Widget> ls = [];
                    if(index<list_voucher.length){
                      ls.add(
                        Container(
                          height: 70,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height/10,
                                width: MediaQuery.of(context).size.width/5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(list_voucher[index].image),)
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${list_voucher[index].name}'),
                                  const Text('Valid until 04.07.21',style: TextStyle(fontWeight: FontWeight.bold))
                                ],
                              ),
                              FilledButton(
                                onPressed: (){
                                    if(widget.client.points >=list_voucher[index].point!){
                                      widget.client.points -= list_voucher[index].point!;
                                      widget.client.list_cart.last.list_contains.add(Contains(
                                          drink: Drinks(
                                              name: list_voucher[index].name,
                                              price: 0,
                                              image: list_voucher[index].image,
                                              counter: 1),
                                          type: 1111)
                                      );
                                      DateTime now = DateTime.now();
                                      widget.cart.time = "${now.year.toString()}-${now.month.toString().padLeft(2,'0')}-${now.day.toString().padLeft(2,'0')} ${now.hour.toString().padLeft(2,'0')}-${now.minute.toString().padLeft(2,'0')}";
                                      widget.client.list_cart.add(widget.cart);
                                    }
                                },
                                style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.indigoAccent)),
                                child: Text(
                                    '${list_voucher[index].point}Pts',
                                    style: const TextStyle(fontSize: 15)
                                ),
                              ),
                            ],
                          ),
                        )
                      );
                    }
                    if(ls.isEmpty){
                      return null;
                    }
                    else {
                      return Column(children: ls,);
                    }
                  },
                ),
              ),
            ],
          )
        )
    );
  }
}