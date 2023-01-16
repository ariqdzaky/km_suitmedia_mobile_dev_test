import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:km_mobile_dev_test/pages/first_page.dart';
import 'package:km_mobile_dev_test/main.dart';
import 'package:km_mobile_dev_test/pages/third_page.dart';

class SecondPage extends StatefulWidget {
  String? named;
  String? selectedUserName;
  SecondPage({super.key, this.named, this.selectedUserName});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<SecondPage> createState() =>
      _SecondPageState(name: named, selectedName: selectedUserName);
}

String saveName = "";

class _SecondPageState extends State<SecondPage> {
  String? name;
  // @override
  // void setState(VoidCallback fn) {
  //   saveName = name!;
  //   super.setState(fn);
  // }

  String? selectedName;

  _SecondPageState({this.name, this.selectedName});

  _getRequests() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: const Color.fromARGB(100, 0, 0, 0),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 1,
        title: const Text(
          'Second Screen',
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
              color: Color(0xFF554AF0), //Theme.of(context).colorScheme.primary,
              size: 40,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: Color.fromARGB(255, 255, 255, 255),
        padding:
            const EdgeInsets.only(top: 24, bottom: 32, left: 24, right: 24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      name == null ? saveName : name!,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          height: 1.4),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Text(
                selectedName == null ? 'Selected User Name' : selectedName!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Container(
                //Button Next
                margin: const EdgeInsets.only(top: 24),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      shadowColor: Color.fromARGB(0, 0, 0, 0),
                    ),
                    onPressed: () async {
                      await Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                                builder: (_) => NameList(
                                      saveNamed: name,
                                    )),
                          )
                          .then((val) => val ? _getRequests() : null);
                      setState(() {});
                    },
                    child: Text('Choose a User')),
              )
            ]),
      ),
    );
  }
}
