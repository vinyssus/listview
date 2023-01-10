import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:listwiew/contact.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'contact.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  showAlertDialog(BuildContext contex, String message){

    Widget cancelButton = TextButton(child: Text("Cancel"), onPressed: (){},
    );
    Widget continueButton = TextButton(child: Text("Continue"), onPressed: (){},
    );
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(message),
      actions: [cancelButton,continueButton],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alert;
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter ListView"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, index){
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(lstContacts[index].photo),
                backgroundColor: Colors.blue,
              ),
              title: Text("Mr"+lstContacts[index].nom),
              subtitle: Text(lstContacts[index].tel),
              onTap: (){
               // print(lstContacts[index].nom);
               // showAlertDialog(context, lstContacts[index].nom);
                Fluttertoast.showToast(msg: lstContacts[index].nom,
                toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM
                );
              },
              trailing: IconButton(icon: Icon(Icons.call),onPressed: (){
                FlutterPhoneDirectCaller.callNumber(lstContacts[index].tel);
              },),
            ),
          );
        },
        itemCount: lstContacts.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      )
    );
  }
}
