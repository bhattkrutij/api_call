import 'package:apicall/services/api_service.dart';
import 'package:flutter/material.dart';

import 'models/profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // BuildContext context;
  ApiService? apiService;

  @override
  void initState() {
    super.initState();
    apiService = ApiService();
    Future<bool?>? test = apiService?.getProfiles();
    print("fdkjssssssssssssssssssssssssssssssssssss${test}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("tetstst"),
        // child: FutureBuilder(
        //   future: apiService?.getProfiles(),
        //   builder: (context, snapshot) {
        //     print(snapshot.data);
        //     if (snapshot.hasData) {
        //       print("get data success");
        //       List<Profile>? profiles = snapshot.data;
        //       return _buildListView(profiles!);
        //     } else if (snapshot.hasError) {
        //       print("error${snapshot.error}");
        //       return Center(
        //         child: Text(
        //             "Error while loading fetching Data${snapshot.error.toString()}"),
        //       );
        //     } else {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // ),
      ),
    );
  }

  Widget _buildListView(List<Profile> profiles) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          Profile profile = profiles[index];
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      profile.name ?? "no name",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(profile.email ?? "empty text"),
                    Text(profile.age.toString()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Warning"),
                                    content: Text(
                                        "Are you sure want to delete data profile ${profile.name}?"),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: Text("Yes"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          apiService
                                              ?.deleteProfile(profile.id ?? 0)
                                              .then((isSuccess) {
                                            if (isSuccess) {
                                              setState(() {});
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Delete data success")));
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          "Delete data failed")));
                                            }
                                          });
                                        },
                                      ),
                                      ElevatedButton(
                                        child: Text("No"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                });
                          },
                          child: Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            // var result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return FormAddScreen(profile: profile);
                            // }));
                            // if (result != null) {
                            //   setState(() {});
                            // }
                          },
                          child: Text(
                            "Edit",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: profiles.length,
      ),
    );
  }
}
