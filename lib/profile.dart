import 'package:flutter/material.dart';
import 'home.dart';
import 'lister.dart';
class ProfilePage extends StatefulWidget{
  late Client client;
  ProfilePage({super.key, required this.client});
  @override
  State<ProfilePage> createState()=>_ProfilePage();
}

class _ProfilePage extends State<ProfilePage>{
  TextEditingController full_name_texter = TextEditingController();
  TextEditingController phone_texter = TextEditingController();
  TextEditingController email_texter = TextEditingController();
  TextEditingController address_texter = TextEditingController();
  @override
  void initState(){
    super.initState();
    full_name_texter.text = widget.client.name!;
    phone_texter.text = widget.client.phone!;
    email_texter.text = widget.client.email!;
    address_texter.text = widget.client.address;
  }
  bool allow_name = false;
  bool allow_phone = false;
  bool allow_email = false;
  bool allow_address = false;
  late String aname = widget.client.name as String;
  late String aphone = widget.client.phone as String;
  late String aemail = widget.client.email as String;
  late String aaddress = widget.client.address;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text('Profile',style: TextStyle(fontSize: 25),),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 150,
                    height: MediaQuery.of(context).size.height/20,
                    child: TextField(
                      controller: full_name_texter,
                      enabled: allow_name,
                      onChanged: (String str){
                        setState(() {
                          aname = str;
                        });
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 5),
                        hintText: 'Full name',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){setState(() {
                    allow_name = !allow_name;
                  });}, icon: const Icon(Icons.edit)),
              ],
              )
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 150,
                      height: MediaQuery.of(context).size.height/20,
                      child: TextField(
                        textAlign: TextAlign.start,
                        controller: phone_texter,
                        enabled: allow_phone,
                        onChanged: (String num){
                          setState(() {
                            aphone = num;
                          });
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 5),
                          hintText: 'Phone number',
                          prefixIcon: const Icon(Icons.phone),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    IconButton(onPressed: (){setState(() {
                      allow_phone = !allow_phone;
                    });}, icon: const Icon(Icons.edit)),
                  ],
                )
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 150,
                      height: MediaQuery.of(context).size.height/20,
                      child: TextField(
                        textAlign: TextAlign.start,
                        controller: email_texter,
                        enabled: allow_email,
                        onChanged: (String mail){
                          aemail = mail;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 5),
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.mail_outline),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    IconButton(onPressed: (){setState(() {
                      allow_email = !allow_email;
                    });}, icon: const Icon(Icons.edit)),
                  ],
                )
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 50,vertical: 10),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 150,
                      height: MediaQuery.of(context).size.height/20,
                      child: TextField(
                        textAlign: TextAlign.start,
                        controller: address_texter,
                        enabled: allow_address,
                        onChanged: (String ad){
                          aaddress = ad;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(vertical: 5),
                          hintText: 'Address',
                          prefixIcon: const Icon(Icons.house),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                    IconButton(onPressed: (){setState(() {
                      allow_address = !allow_address;
                    });}, icon: const Icon(Icons.edit)),
                  ],
                )
            ),
            FilledButton(onPressed: (){
              list_client.add(Client(address: aaddress, loyalty: widget.client.loyalty, points: widget.client.points,email: aemail, phone: aphone,name: aname));
              print(list_client.length);
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(client:list_client.last),));
            }, child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}