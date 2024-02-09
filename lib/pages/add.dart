import 'package:carsapp/services/services.dart';
import 'package:flutter/material.dart';
class Addpg extends StatefulWidget {
  const Addpg({super.key});

  @override
  State<Addpg> createState() => _AddpgState();
}

class _AddpgState extends State<Addpg> {
  final TextEditingController name=new TextEditingController();
  final TextEditingController model=new TextEditingController();
  final TextEditingController price=new TextEditingController();
  final TextEditingController mileage=new TextEditingController();
  void sentbutton()async {
    final response = await PostApiservice().sentData(name.text, model.text, price.text, mileage.text);


    if (response['status'] == 'success') {
      print("sucessfully add");
    }
    else {
      print("error");
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("Add page"),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 800,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.pink.withOpacity(0.3),
                      Colors.white.withOpacity(0.3),

                    ]
                )
            ),
            child: Column(
                children: [
                  TextField(
                    controller:name,
                    decoration: InputDecoration(
                      hintText: "Name",
                      labelText: "Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: model,
                    decoration: InputDecoration(
                      hintText: "model",
                      labelText: "model",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: price,
                    decoration: InputDecoration(
                      hintText: "price",
                      labelText: " price",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: mileage,
                    decoration: InputDecoration(
                      hintText: "mileage",
                      labelText: "mileage",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amberAccent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          )
                      ),

                      onPressed: (){
                        sentbutton();

                      },
                      child:Text( "Submit")
                      ,
                    ),
                  ),]
            ),
          ),
        ),
      ),
    );
  }
}
