

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var formKey = GlobalKey<FormState>();
  var tfKullaniciadi = TextEditingController();
  var tfSifre = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

              Padding(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child:
                  Column(
                   children: [
                     TextFormField(
                       controller:  tfKullaniciadi,
                       decoration: InputDecoration(hintText: "Kullanıcı Adı"),
                       validator: (tfGirdisi)
                       {
                        if(tfGirdisi!.isEmpty)
                        {
                          return "Kullanıcı Adı Giriniz";
                        }

                        return null;
                       },
                     ),

                     TextFormField(
                       controller:  tfSifre,
                       obscureText: true,
                       decoration: InputDecoration(hintText: "Şifre"),
                       validator: (tfGirdisi)
                       {
                         if(tfGirdisi!.isEmpty)
                         {
                           return "Şifre Giriniz";
                         }

                         if(tfGirdisi.length<6)
                           {
                             return "Şifreniz en az 6 karakterden oluşmalıdır.";
                           }


                         return null;
                       },
                     ),

                      ElevatedButton(onPressed: ()
                          {
                            bool kontrolSonucu = formKey.currentState!.validate();

                            if(kontrolSonucu)
                              {
                                print("Kullanıcı Adı: ${tfKullaniciadi.text}, Şifre: ${tfSifre.text}");
                                tfSifre.clear();
                                tfKullaniciadi.clear();
                          }

                          }, child: Text("Giriş"))


                   ],

                  ),

                ),
              ),


          ],
        ),
      ),

    );
  }
}
