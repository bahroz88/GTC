import 'package:ctg/provider/data.dart';
import 'package:ctg/provider/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Customer extends StatefulWidget {
  const Customer({super.key});

  @override
  State<Customer> createState() => _CustomerState();
}

class _CustomerState extends State<Customer> {
  TextEditingController _controller = TextEditingController();
  var _controller2 = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title:
              Text("GTC", style: TextStyle(fontSize: 20, color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.blue[300],
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 10, left: 10, top: 20, bottom: 10),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    label: Text(
                      "Enter Name",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 10, left: 10, top: 10, bottom: 10),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _controller2,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[100],
                    label: Text(
                      "Enter Id",
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                  ),
                ),
              ),
              Consumer<Item>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: MaterialButton(
                      onPressed: () {
                        value.add(Data(
                            name: _controller.text,
                            id: int.parse(_controller2.text)));
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      color: Colors.green,
                      minWidth: 170,
                      height: 40,
                      splashColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(width: 1, color: Colors.grey)),
                    ),
                  );
                },
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Name"),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text("ID"),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 35)),
              Expanded(child: Consumer<Item>(
                builder: (context, value, child) {
                  return ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: value.list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        tileColor: Colors.grey[50],
                        title: Text("${value.list[index].name}"),
                        trailing: Text("${value.list[index].id}"),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 10,
                        color: Colors.white,
                        height: 8,
                      );
                    },
                  );
                },
              )),
            ],
          ),
        ));
  }
}
