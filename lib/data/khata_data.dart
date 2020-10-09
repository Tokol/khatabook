import 'package:class03khata/model/khata.dart';
import 'package:flutter/foundation.dart';

class KhataData  extends ChangeNotifier{

  List<Khata> _khataList = [];


  List<Khata> getKhataList(){
    return _khataList;
  }


  void insertKhata(Khata khata){

    _khataList.add(khata);
    notifyListeners();

  }



  void removeKhata(int position){

    _khataList.removeAt(position);
    notifyListeners();

  }

  void updateKhata(int position, Khata khata){

    _khataList[position] = khata;
    notifyListeners();

  }



}