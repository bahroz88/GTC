import 'package:ctg/customer.dart';
import 'package:ctg/provider/item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> name = [
    "Dashbord",
    "Invoice",
    "Inventory",
    "Trader",
    "Item",
    "Report",
    "Balance"
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Item(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:
              Text("GTC", style: TextStyle(fontSize: 20, color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.blue[300],
          elevation: 0,
        ),
        body: ListView.separated(
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text("${name[index]}",
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  tileColor: Colors.white,
                  trailing: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.greenAccent),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_right,
                        size: 40,
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (contex) {
                          return Customer();
                        }));
                      },
                    ),
                  ),
                ));
          },
          separatorBuilder: (context, index) {
            return Divider(
              height: 15,
              thickness: 7,
              color: Colors.grey[200],
            );
          },
        ),
      ),
    );
  }
}
