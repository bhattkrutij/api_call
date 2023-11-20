import 'package:flutter/material.dart';
import 'package:testlycroys/services/api_service.dart';
import 'package:testlycroys/utils/string_utils.dart';
import 'package:testlycroys/widgets/list_item.dart';

import '../model/response.dart';
import '../widgets/appbar_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AppBarCustom(),
                  Expanded(
                      child: FutureBuilder<ResponseData>(
                    future: ApiService.getData(),
                    builder: (context, snapshot) {
                      print(snapshot.data);
                      if (snapshot.hasData) {
                        List<Data>? res = snapshot.data!.data;
                        return Padding(
                          padding: EdgeInsets.only(bottom: 60.0),
                          child: ListView.builder(
                              itemCount: res!.length,
                              itemBuilder: (context, index) {
                                return ListItem(res[index]);
                              }),
                        );
                      } else if (snapshot.hasError) {
                        print("error${snapshot.error}");
                        return Center(
                          child: Text(
                              "Error while loading fetching Data${snapshot.error.toString()}"),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )),
                ],
              ),
            ),
            Positioned(
              bottom: 5,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                ),
                width: 200,
                height: 90,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        StringUtils.addGasStation,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
