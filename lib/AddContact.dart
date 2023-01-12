
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {

  TextEditingController nom = TextEditingController();
  TextEditingController numero = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Color _textColor = Colors.white;

  bool _notZero = false;

  void _resetFields(){
    nom.text = "";
    numero.text = "";
    setState(() {
      _formkey = GlobalKey<FormState>();
      _notZero = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 0.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Nom", style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 24,
                  ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(30, 30, 10, 10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 0.2,
                              blurRadius: 1,
                              offset: const Offset(1, 3),
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50.0),
                          )
                      ),
                      child: TextFormField(
                        controller: nom,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Entrer le nom!';
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          hintStyle: const TextStyle(fontSize: 20.0, color: Colors.black26),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: const BorderSide(width: 0, style: BorderStyle.none,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("Téléphone", style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 24,
                  ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(30, 30, 10, 10),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 0.2,
                              blurRadius: 1,
                              offset: const Offset(1, 3),
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50.0),
                          )
                      ),
                      child: TextFormField(
                        controller: numero,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Entrer le numéro!';
                          }
                        },
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          contentPadding:
                          const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          hintStyle: const TextStyle(fontSize: 20.0, color: Colors.black26),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            borderSide: const BorderSide(width: 0, style: BorderStyle.none,
                            ),
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: ElevatedButton(
                  onPressed: (){
                    if(_formkey.currentState!.validate()){
                      //_calculateIMC();
                    }
                  },
                  child: const Padding(padding: EdgeInsets.all(10.0),
                    child: Text("Ajouter",style: TextStyle(fontSize: 20),),
                  ),
                  style: ElevatedButton.styleFrom(primary: Colors.black,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
