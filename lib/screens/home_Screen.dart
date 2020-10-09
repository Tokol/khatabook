import 'package:class03khata/data/khata_data.dart';
import 'package:class03khata/model/khata.dart';
import 'package:class03khata/widgets/khata_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<KhataData>(
      builder: (context, data, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Khata  Record'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Khata _khata = Khata();

                  final DateTime now = DateTime.now();
                  final DateFormat formatter = DateFormat('yyyy-MM-dd');
                  _khata.date = (formatter.format(now)).toString();

                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                              },
                              child: Container(
                                child: ListView(
                                  children: <Widget>[
                                    KhataTextField(
                                      hintValue: 'Name',
                                      onChanged: (value) {
                                        _khata.name = value;
                                      },
                                    ),
                                    KhataTextField(
                                      hintValue: 'Item Name',
                                      onChanged: (value) {
                                        _khata.itemName = value;
                                      },
                                    ),
                                    KhataTextField(
                                      hintValue: 'Quantity',
                                      keyboard: TextInputType.number,
                                      onChanged: (value) {
                                        _khata.quantity = int.parse(value);
                                      },
                                    ),
                                    KhataTextField(
                                      hintValue: 'Rate',
                                      keyboard: TextInputType.number,
                                      onChanged: (value) {
                                        _khata.rate = int.parse(value);
                                      },
                                    ),
                                    KhataTextField(
                                      hintValue: 'Contact Number',
                                      onChanged: (value) {
                                        _khata.contactNumber = value;
                                      },
                                    ),
                                    KhataTextField(
                                      hintValue: 'Email ',
                                      keyboard: TextInputType.emailAddress,
                                      onChanged: (value) {
                                        _khata.email = value;
                                      },
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        DatePicker.showDatePicker(context,
                                            showTitleActions: true,
                                            minTime: DateTime(1995, 1, 1),
                                            maxTime: DateTime.now(),
                                            onChanged: (date) {
                                          DateFormat formatter =
                                              DateFormat('yyyy-MM-dd');
                                          state(() {
                                            _khata.date =
                                                (formatter.format(date))
                                                    .toString();
                                          });
                                        }, onConfirm: (date) {
                                          DateFormat formatter =
                                              DateFormat('yyyy-MM-dd');

                                          state(() {
                                            _khata.date =
                                                (formatter.format(date))
                                                    .toString();
                                          });
                                        },
                                            currentTime: DateTime.now(),
                                            locale: LocaleType.en);
                                      },
                                      child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          padding: EdgeInsets.all(20.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            border: Border.all(
                                                width: 0.8,
                                                color: Colors.black38),
                                          ),
                                          child: Text(
                                            _khata.date,
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                    KhataTextField(
                                      hintValue: 'Remark',
                                      onChanged: (value) {
                                        _khata.remark = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context)
                                                  .viewInsets
                                                  .bottom ==
                                              0
                                          ? 10
                                          : 300,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        data.insertKhata(_khata);
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        padding: EdgeInsets.all(20.0),
                                        decoration: BoxDecoration(
                                            color: Colors.greenAccent,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            border: Border.all(
                                                width: 0.8,
                                                color: Colors.black38)),
                                        child: Text(
                                          'Save',
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      });
                },
              )
            ],
          ),
          body: ListView.builder(
            itemCount: data.getKhataList().length,
            itemBuilder: (contex, position) {

           Khata resultKhata =   data.getKhataList()[position];

              return Padding(
                padding: EdgeInsets.all(20.0),

                child: Card(
elevation: 10.0,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),


                    child: Column(
                      children: <Widget>[

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[

                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: (){

                             // Khata _khata = Khata();


                           Khata _khata = data.getKhataList()[position];

                           showModalBottomSheet(context: context,builder: (BuildContext context){


                            return  StatefulBuilder(
                                builder: (context, state) {
                                  return GestureDetector(
                                    onTap: () {
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                    },
                                    child: Container(
                                      child: ListView(
                                        children: <Widget>[
                                          KhataTextField(
                                            hintValue: _khata.name,
                                            onChanged: (value) {
                                              _khata.name = value;
                                            },
                                          ),
                                          KhataTextField(
                                            hintValue: _khata.itemName,
                                            onChanged: (value) {
                                              _khata.itemName = value;
                                            },
                                          ),
                                          KhataTextField(
                                            hintValue: (_khata.quantity).toString(),
                                            keyboard: TextInputType.number,
                                            onChanged: (value) {
                                              _khata.quantity = int.parse(value);
                                            },
                                          ),
                                          KhataTextField(
                                            hintValue: (_khata.rate).toString(),
                                            keyboard: TextInputType.number,
                                            onChanged: (value) {
                                              _khata.rate = int.parse(value);
                                            },
                                          ),
                                          KhataTextField(
                                            hintValue: _khata.contactNumber,
                                            onChanged: (value) {
                                              _khata.contactNumber = value;
                                            },
                                          ),
                                          KhataTextField(
                                            hintValue: _khata.email,
                                            keyboard: TextInputType.emailAddress,
                                            onChanged: (value) {
                                              _khata.email = value;
                                            },
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              DatePicker.showDatePicker(context,
                                                  showTitleActions: true,
                                                  minTime: DateTime(1995, 1, 1),
                                                  maxTime: DateTime.now(),
                                                  onChanged: (date) {
                                                    DateFormat formatter =
                                                    DateFormat('yyyy-MM-dd');
                                                    state(() {
                                                      _khata.date =
                                                          (formatter.format(date))
                                                              .toString();
                                                    });
                                                  }, onConfirm: (date) {
                                                    DateFormat formatter =
                                                    DateFormat('yyyy-MM-dd');

                                                    state(() {
                                                      _khata.date =
                                                          (formatter.format(date))
                                                              .toString();
                                                    });
                                                  },
                                                  currentTime: DateTime.now(),
                                                  locale: LocaleType.en);
                                            },
                                            child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 10),
                                                padding: EdgeInsets.all(20.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(20.0)),
                                                  border: Border.all(
                                                      width: 0.8,
                                                      color: Colors.black38),
                                                ),
                                                child: Text(
                                                  _khata.date,
                                                  textAlign: TextAlign.center,
                                                )),
                                          ),
                                          KhataTextField(
                                            hintValue: 'Remark',
                                            onChanged: (value) {
                                              _khata.remark = value;
                                            },
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom ==
                                                0
                                                ? 10
                                                : 300,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              data.updateKhata(position,_khata);
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 20),
                                              padding: EdgeInsets.all(20.0),
                                              decoration: BoxDecoration(
                                                  color: Colors.greenAccent,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(20.0)),
                                                  border: Border.all(
                                                      width: 0.8,
                                                      color: Colors.black38)),
                                              child: Text(
                                                'Update',
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );




                           });








                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: (){
                              data.removeKhata(position);

                            },
                          ),

                        ],),

                        Text(data.getKhataList()[position].name,style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, ),),


                        Text('Item : ${resultKhata.itemName}',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, ),),
                        Text('Quantity : ${resultKhata.quantity}',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, ),),
                        Text('Rate : ${resultKhata.rate}',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, ),),

                        Text('Total Price : ${(resultKhata.quantity)*(resultKhata.rate)}',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, ),),

                        Text('Issue Date : ${(resultKhata.date)}',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, ),),

                        SizedBox(height: 10,),

                        Text('Remark : ${resultKhata.remark}',style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.green, decoration: TextDecoration.underline, decorationColor: Colors.red ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[

                          IconButton(icon: Icon(Icons.email),
                          onPressed: (){

                            Uri _emailLaunchUri = Uri(
                                scheme: 'mailto',
                                path: resultKhata.email,
                                queryParameters: {
                                  'subject': 'Reminder of due please pay in time!',
                                  'body': 'Your due is ${(resultKhata.quantity)*(resultKhata.rate)} remaing please pay it in time or else Please make us a call',
                                }
                            );

                            launch(_emailLaunchUri.toString());
                          },
                          ),



                            IconButton(icon: Icon(Icons.sms),
                              onPressed: (){

                                launch('sms: ${resultKhata.contactNumber}');
                              },
                            ),

                          IconButton(icon: Icon(Icons.phone),
                            onPressed: (){
                              launch('tel: ${resultKhata.contactNumber}');

                            },
                          ),

                        ],)

                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
