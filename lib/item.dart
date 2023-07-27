import 'package:flutter/material.dart';
import 'cart.dart';
import 'lister.dart';

const List<Widget> shoter = <Widget>[Text('Single'),Text('Double')];
const List<Widget> selecter = <Widget>[ImageIcon(AssetImage('assets/icon/hot.png'),color: Colors.black),ImageIcon(AssetImage('assets/icon/cold.png'),color: Colors.black,)];
const List<Widget> sizer = <Widget>[Text('S'),Text('M'),Text('L'),];
const List<Widget> icer = <Widget>[ImageIcon(AssetImage('assets/icon/small.png')),ImageIcon(AssetImage('assets/icon/med.png'),size: 40),ImageIcon(AssetImage('assets/icon/lar.png'),size: 40,)];

class OptionPage extends StatefulWidget{
  late Drinks drink;
  late Cart cart ;
  late Client client;
  OptionPage({super.key,required this.drink,required this.cart,required this.client});
  @override
  State<OptionPage> createState()=>_OptionPage();
}
class _OptionPage extends State<OptionPage>{
  late int shot = 0;
  late int select =0;
  late int size =0;
  late int ice =0;
  late int type =0;
  int _counter = 0;
  late List<bool> selectedshot = <bool>[false, false];
  late List<bool> selectedtemp = <bool>[false, false];
  late List<bool> selectedsize = <bool>[false, false, false];
  late List<bool> selectedice  = <bool>[false, false, false];
  void _incrementCounter() {
    setState(() {
      _counter++;
      widget.drink.counter++;
    });
  }
  void _decrementCounter() {
    setState(() {
      if(_counter>0){
        _counter--;
        widget.drink.counter--;
      }
    });
  }
  int cal(){
    type = shot*1000+select*100+size*10+ice;
    return type;
  }
  @override
  void initState(){
    super.initState();
    widget.drink.counter = 0;
  }
  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BackButton(
                    color: Colors.black,
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  const Text('Details',style: TextStyle(fontSize: 20),),
                  IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(cart: widget.cart,client:widget.client,),));
                  }, icon: const Icon(Icons.shopping_cart))
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(widget.drink.image),fit: BoxFit.cover)
                ),//item image
                height: MediaQuery.of(context).size.height/4,
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.drink.name as String,style: const TextStyle(fontSize: 20),),//item name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: _decrementCounter,
                        ),
                        Text(
                          '$_counter',
                          style: const TextStyle(fontSize: 24.0),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: _incrementCounter,
                        ),

                      ],
                    )
                  ],
                )
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Shot',style: TextStyle(fontSize: 20),),
                    ToggleButtons(
                      direction:Axis.horizontal,
                      onPressed: (int index) {
                        setState(() {
                          // The button that is tapped is set to true, and the others to false.
                          for (int i = 0; i < selectedshot.length; i++) {
                            selectedshot[i] = i == index;
                            shot = index + 1;
                          }
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      selectedBorderColor: Colors.red[700],
                      selectedColor: Colors.white,
                      fillColor: Colors.blue[200],
                      color: Colors.blue[400],
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                        minWidth: 80.0,
                      ),
                      isSelected: selectedshot,
                      children: shoter,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Select',style: TextStyle(fontSize: 20),),
                    ToggleButtons(
                      direction: Axis.horizontal,
                      onPressed: (int index){
                        setState(() {
                          // The button that is tapped is set to true, and the others to false.
                          for (int i = 0; i < selectedtemp.length; i++) {
                            selectedtemp[i] = i == index;
                          }
                          select = index + 1;
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      selectedBorderColor: Colors.blue[700],
                      selectedColor: Colors.white,
                      fillColor: Colors.blue[200],
                      color: Colors.blue[400],
                      isSelected: selectedtemp,
                      children: selecter,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Size',style: TextStyle(fontSize: 20),),
                    ToggleButtons(
                      direction: Axis.horizontal,
                      onPressed: (int index) {
                        setState(() {
                          // The button that is tapped is set to true, and the others to false.
                          for (int i = 0; i < selectedsize.length; i++) {
                            selectedsize[i] = i == index;
                          }
                          size = index + 1;
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      selectedBorderColor: Colors.blue[700],
                      selectedColor: Colors.white,
                      fillColor: Colors.blue[200],
                      color: Colors.blue[400],
                      isSelected: selectedsize,
                      children: sizer,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Ice',style: TextStyle(fontSize: 20),),
                    ToggleButtons(
                      direction: Axis.horizontal,
                      onPressed: (int index) {
                        setState(() {
                          // The button that is tapped is set to true, and the others to false.
                          if(select ==2) {
                            for (int i = 0; i < selectedice.length; i++) {
                              selectedice[i] = i == index;
                            }
                            ice = index + 1;
                          }else{
                            selectedice = <bool>[false,false,false];
                            ice = 0;
                          }
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      isSelected: selectedice,
                      selectedBorderColor: Colors.blue[700],
                      selectedColor: Colors.white,
                      fillColor: Colors.blue[200],
                      color: Colors.blue[400],
                      children: icer,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB
                  (0, MediaQuery.of(context).size.height/10, 0, 0),
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Total amount'),
                    Text('\$${widget.drink.calculateTotal(size,shot)}')
                  ],
                ),
              ),
              FilledButton(
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width-40,MediaQuery.of(context).size.height/20))
                ),
                onPressed: (){
                  if(widget.drink.calculateTotal(size,shot) != 0 && cal() !=0 && type >=1110){
                    widget.cart.list_contains.add(Contains(drink: widget.drink, type: cal()));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(cart: widget.cart,client: widget.client,)));
                    widget.drink = Drinks(name: widget.drink.name, price: widget.drink.price, image: widget.drink.image, counter: _counter,point: widget.drink.point);
                  }
                },
                child:  const Text('Add to cart'),
              ),
            ],
          ),
      ),
    );

  }

}