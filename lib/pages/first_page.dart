import 'package:flutter/material.dart';
import 'package:km_mobile_dev_test/pages/second_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<LoginPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginPage> {
  late String _counter;
  late String _name; // = new TextEditingController();
  late String _palindrome;

  _getRequests() async {}

  RegExp digitValidator = RegExp("[0-9]+");
  bool isANumber = true;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 48, right: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  //controller: _name,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      errorText: isANumber ? null : "Please enter a name",
                      labelText: 'Name',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(100, 0, 0, 0)),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(100, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(12.0)),
                      errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(183, 255, 0, 0)),
                          borderRadius: BorderRadius.circular(12.0)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(183, 255, 0, 0)),
                          borderRadius: BorderRadius.circular(12.0))),
                  onChanged: (value) {
                    if (value.isEmpty || digitValidator.hasMatch(value)) {
                      setValidator(false);
                    } else {
                      setValidator(true);
                    }
                    setState(() {
                      _name = value.trim();
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Palindrome',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(200, 156, 156, 156)),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(200, 156, 156, 156)),
                          borderRadius: BorderRadius.circular(12.0))),
                  onChanged: (value) {
                    setState(() {
                      _palindrome = value.trim();
                    });
                  },
                ),
                Container(
                  //Button Check
                  margin: const EdgeInsets.only(top: 48),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        shadowColor: Color.fromARGB(0, 0, 0, 0),
                      ),
                      onPressed: () {
                        if (_palindromeCheck(_palindrome)) {
                          _counter = "isPalindrome";
                        } else {
                          _counter = "notPalindroem";
                        }
                        ;
                        showDialogNow(context);
                      },
                      child: Text('Check')),
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
                        if (_name != null && _name != '') {
                          await Navigator.of(context)
                              .push(
                                MaterialPageRoute(
                                    builder: (_) => SecondPage(
                                          named: '$_name',
                                        )),
                              )
                              .then((val) => val ? _getRequests() : null);
                        } else {
                          setValidator(false);
                        }
                      },
                      child: Text('Next')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setValidator(valid) {
    setState(() {
      isANumber = valid;
    });
  }

  void showDialogNow(BuildContext context) {
    showDialog(
        builder: (context) => AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              alignment: Alignment.center,
              title: const Text(
                'Result',
                textAlign: TextAlign.center,
              ),
              content: Text(
                '$_counter',
                textAlign: TextAlign.center,
              ),
              actions: [
                OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('Close'))
              ],
            ),
        context: context);
  }

  bool _palindromeCheck(String input) {
    int length = input.length;
    for (int i = 0; i < length / 2; i++) {
      if (input[i] != input[length - i - 1]) {
        return false;
      }
    }
    return true;
  }
}
