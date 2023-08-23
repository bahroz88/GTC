import 'package:flutter/widgets.dart';

import 'data.dart';

class Item extends ChangeNotifier {
  List<Data> data = [];
  String Id = "4000";
  void add(Data data1) {
    data.add(data1);
    notifyListeners();
  }

  List<Data> get list => data;
}
