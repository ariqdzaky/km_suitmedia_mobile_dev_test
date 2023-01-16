import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:km_mobile_dev_test/pages/second_page.dart';

// ignore: must_be_immutable
class NameList extends StatefulWidget {
  String? saveNamed;

  NameList({super.key, this.saveNamed});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<NameList> createState() => _NameListState();
}

class _NameListState extends State<NameList> {
  late Map mapResp;
  late List listData;
  late List listData2;

  _getRequests() async {}

  // late List<Datas> datas;
  Future dataCall() async {
    http.Response resp;
    resp = await http.get(Uri.parse("https://reqres.in/api/users?page=1"));
    if (resp.statusCode == 200) {
      setState(() {
        mapResp = jsonDecode(resp.body);
        listData = mapResp['data'];
        listData = listData;
      });
    } else {
      throw Exception('Failed to Load');
    }
  }

  @override
  void initState() {
    dataCall();
    super.initState();
  }

  Future refresh() async {
    http.Response resp;
    resp = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (resp.statusCode == 200) {
      setState(() {
        mapResp = jsonDecode(resp.body);
        listData2 = mapResp['data'];
        listData.addAll(listData2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          shadowColor: const Color.fromARGB(100, 0, 0, 0),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 1,
          title: const Text(
            'Third Screen',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          leading: Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.chevron_left_rounded,
                color:
                    Color(0xFF554AF0), //Theme.of(context).colorScheme.primary,
                size: 40,
              ),
            ),
          ),
        ),
        body: listData.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: refresh,
                child: Container(
                  color: Color.fromARGB(255, 255, 255, 255),
                  padding: const EdgeInsets.only(
                      top: 14, bottom: 14, left: 24, right: 24),
                  child: listData.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: listData.length,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => SecondPage(
                                            selectedUserName: listData[index]
                                                    ['first_name'] +
                                                " " +
                                                listData[index]['last_name'],
                                            named: widget.saveNamed,
                                          )),
                                );
                              },
                              child: Container(
                                //Avatar Photo
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: Color.fromARGB(16, 0, 0, 0),
                                  width: 1,
                                ))),
                                child: Row(children: [
                                  Container(
                                    margin: const EdgeInsets.all(20),
                                    width: 49,
                                    height: 49,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(35),
                                      image: DecorationImage(
                                          image: listData != null
                                              ? NetworkImage(
                                                  listData[index]['avatar'])
                                              : const NetworkImage(''),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        //First name & last name
                                        listData[index]['first_name'] +
                                            ' ' +
                                            listData[index]['last_name'],
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        //Email
                                        listData[index]['email'],
                                        style: const TextStyle(
                                            fontSize: 10,
                                            height: 1.8,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromARGB(153, 0, 0, 0)),
                                      )
                                    ],
                                  ),
                                ]),
                              ),
                            );
                          })),
                ),
              ));
  }
}
