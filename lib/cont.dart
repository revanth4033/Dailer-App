// cont.dart

import 'package:flutter/material.dart';
import 'hist.dart'; // Importing the new history screen
import 'fav.dart'; // Importing the Favorites screen

class CodiaPage extends StatefulWidget {
  CodiaPage({Key? key});

  @override
  State<StatefulWidget> createState() => _CodiaPage();
}

class _CodiaPage extends State<CodiaPage> {
  TextEditingController _numberController = TextEditingController();

  List<String> contacts = [
    'Daddy',
    'Mummy',
    'Bro',
    'Sissy',
    'Aunt',
    'Friend',
    'Tom',
    'Cousin1',
    'Cousin2',
  ];

  List<String> mobileNumbers = [
    '+91 8465189350',
    '+91 9024165875',
    '+91 7423084685',
    '+91 8674032105',
    '+91 9254680826',
    '+91 9723309745',
    '+91 8512389750',
    '+91 9467584755',
    '+91 9353947625',
  ];

  int _currentIndex = 0;

  void _showDialPad() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 16.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _numberController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: '',
                        filled: true,
                        fillColor: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                        prefixIcon: Icon(Icons.phone, color: Colors.white),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.backspace, color: Colors.white),
                          onPressed: () {
                            if (_numberController.text.isNotEmpty) {
                              setState(() {
                                _numberController.text =
                                    _numberController.text.substring(0, _numberController.text.length - 1);
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDialButton('1', '~', greyButton: true),
                      _buildDialButton('2', 'ABC', greyButton: true),
                      _buildDialButton('3', 'DEF', greyButton: true),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDialButton('4', 'GHI', greyButton: true),
                      _buildDialButton('5', 'JKL', greyButton: true),
                      _buildDialButton('6', 'MNO', greyButton: true),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDialButton('7', 'PQRS', greyButton: true),
                      _buildDialButton('8', 'TUV', greyButton: true),
                      _buildDialButton('9', 'WXYZ', greyButton: true),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDialButton('*', ' ', greyButton: true),
                      _buildDialButton('0', '+', greyButton: true),
                      _buildDialButton('#', ' ', greyButton: true),
                    ],
                  ),
                  _buildCallButton(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDialButton(String number, String letters, {bool greyButton = false}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _numberController.text += number;
            });
          },
          style: ElevatedButton.styleFrom(
            primary: greyButton ? Colors.grey[800] : Colors.green,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Set rounded corners
            ),
            padding: EdgeInsets.all(16.0),
          ),
          child: Column(
            children: [
              Text(
                number,
                style: TextStyle(fontSize: 18.0),
              ),
              if (letters.isNotEmpty)
                Text(
                  letters,
                  style: TextStyle(fontSize: 14.0),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCallButton() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          // Add call functionality here
          print('Call button pressed');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          shape: CircleBorder(),
          padding: EdgeInsets.all(16.0),
        ),
        child: Icon(
          Icons.call,
          size: 24.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _numberController,
                  decoration: InputDecoration(
                    hintText: 'Search contacts',
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 16.0),
                Text(
                  'All Contacts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    contacts[index],
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    'Mobile ${mobileNumbers[index]}',
                    style: TextStyle(color: Color(0xFF7C7C7C)),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/${contacts[index].toLowerCase()}.png'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts, color: _currentIndex == 0 ? Color(0xFF6E40C8) : Colors.grey),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: _currentIndex == 1 ? Color(0xFF6E40C8) : Colors.grey),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: _currentIndex == 2 ? Color(0xFF6E40C8) : Colors.grey),
            label: 'Favorites',
          ),
        ],
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF6E40C8),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryPage()),
              );
            } else if (_currentIndex == 2) {
              // Redirect to the Favorites screen (fav.dart)
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavPage()), // Replace FavPage with the actual class name of your Favorites screen
              );
            }
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show dialpad
          _showDialPad();
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.dialpad),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CodiaPage(),
  ));
}
