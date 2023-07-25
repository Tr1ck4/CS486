import 'package:flutter/material.dart';
import 'cart.dart';
import 'lister.dart';

const List<Widget> shoter = <Widget>[Text('Single'),Text('Double')];
const List<Widget> selecter = <Widget>[Icon(Icons.fire_extinguisher),Icon(Icons.ice_skating)];
const List<Widget> sizer = <Widget>[Icon(Icons.brightness_1_outlined),Icon(Icons.brightness_medium),Icon(Icons.brightness_7)];
const List<Widget> icer = <Widget>[Icon(Icons.one_k_outlined),Icon(Icons.two_k_outlined),Icon(Icons.three_k_outlined)];

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
  Widget build(BuildContext context){
    final List<bool> _selectedshot = <bool>[true, false];
    final List<bool> _selectedtemp = <bool>[true,false];
    final List<bool> _selectedsize = <bool>[true, false, false];
    final List<bool> _selectedice  = <bool>[true, false, false];

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
                      direction: Axis.horizontal,
                      onPressed: (int index) {
                        setState(() {
                          // The button that is tapped is set to true, and the others to false.
                          for (int buttonIndex = 0; buttonIndex < _selectedshot.length; buttonIndex++) {
                            if (buttonIndex == index) {
                              _selectedshot[buttonIndex] = !_selectedshot[buttonIndex];
                            } else {
                              _selectedshot[buttonIndex] = false;
                            }
                          }
                          shot = index + 1;
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      selectedBorderColor: Colors.red[700],
                      selectedColor: Colors.white,
                      fillColor: Colors.red[200],
                      color: Colors.red[400],
                      constraints: const BoxConstraints(
                        minHeight: 40.0,
                        minWidth: 80.0,
                      ),
                      isSelected: _selectedshot,
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
                          for (int i = 0; i < _selectedtemp.length; i++) {
                            _selectedtemp[i] = i == index;
                          }
                          select = index + 1;
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      selectedBorderColor: Colors.blue[700],
                      selectedColor: Colors.white,
                      fillColor: Colors.blue[200],
                      color: Colors.blue[400],
                      isSelected: _selectedtemp,
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
                          for (int i = 0; i < _selectedsize.length; i++) {
                            _selectedsize[i] = i == index;
                          }
                          size = index + 1;
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      selectedBorderColor: Colors.blue[700],
                      selectedColor: Colors.white,
                      fillColor: Colors.blue[200],
                      color: Colors.blue[400],
                      isSelected: _selectedsize,
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
                          for (int i = 0; i < _selectedice.length; i++) {
                            _selectedice[i] = i == index;
                          }
                          ice = index + 1;
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      selectedBorderColor: Colors.blue[700],
                      selectedColor: Colors.white,
                      fillColor: Colors.blue[200],
                      color: Colors.blue[400],
                      isSelected: _selectedice,
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
                  if(widget.drink.calculateTotal(size,shot) != 0 && cal() !=0){
                    widget.cart.list_contains.add(Contains(drink: widget.drink, type: cal()));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(cart: widget.cart,client: widget.client,)));
                    widget.drink = Drinks(name: widget.drink.name, price: widget.drink.price, image: widget.drink.image, counter: _counter);
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