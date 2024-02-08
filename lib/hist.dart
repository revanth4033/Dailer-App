// hist.dart

import 'package:flutter/material.dart';
import 'cont.dart';
import 'fav.dart';
class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int _currentIndex = 1; // Set the current index to 1 for 'History'
  TextEditingController _numberController = TextEditingController();

  List<String> todayCalls = [
    'Mummy - Just now',
    'Bro - 55 min ago',
  ];

  List<String> yesterdayCalls = [
    'Sissy - Tue',
    'Tom - Tue',
    'Cousin1 - Tue',
  ];

  List<String> olderCalls = [
    'Daddy - Mon',
    'Aunt - Sun',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search contacts',
                  filled: true,
                  fillColor: Colors.grey[800], // Change color to grey
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintStyle: TextStyle(color: Colors.grey), // Change color to grey
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: Text(
                'Call History',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildHistoryCategory('Today', todayCalls),
                  _buildHistoryCategory('Yesterday', yesterdayCalls),
                  _buildHistoryCategory('Older', olderCalls),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
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
          });

          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CodiaPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavPage()), // Replace with the actual name of your FavoritesPage class
            );
          }
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

  Widget _buildHistoryCategory(String category, List<String> calls) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            category,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        for (String call in calls) _buildCallEntry(call),
      ],
    );
  }

  Widget _buildCallEntry(String call) {
    String contactName = call.split(' - ')[0];
    String details = call.split(' - ')[1];

    IconData arrowIcon;
    double arrowSize;
    double arrowRotation;
    String timeAgo;

    if (details.contains('Just now')) {
      arrowIcon = Icons.arrow_downward;
      arrowSize = 15.0;
      arrowRotation = 45.0;
      timeAgo = 'Just now';
    } else if (details.contains('min ago')) {
      arrowIcon = Icons.arrow_upward;
      arrowSize = 15.0;
      arrowRotation = 45.0;
      timeAgo = details;
    } else {
      arrowIcon = Icons.arrow_downward;
      arrowSize = 15.0;
      arrowRotation = 225.0;
      timeAgo = details;
    }

    return ListTile(
      title: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/${contactName.toLowerCase()}.png'), // Adjust the path accordingly
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                contactName,
                style: TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  Transform.rotate(
                    angle: arrowRotation * (3.14159 / 180),
                    child: Icon(
                      arrowIcon,
                      color: Colors.grey,
                      size: arrowSize,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Mobile . $timeAgo',
                    style: TextStyle(color: Colors.grey, fontSize: 12.0), // Change color to grey and decrease font size
                  ),
                ],
              ),
            ],
          ),
          Spacer(), // Add this spacer to push the call icon to the right
          IconButton(
            icon: Icon(Icons.call, color: Colors.white), // You can change the color as per your requirement
            onPressed: () {
              // Add the call functionality here
              print('Calling $contactName');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDialButton(String number, String letters) {
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
            primary: Colors.grey[800],
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
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
                  style: TextStyle(fontSize: 14.0), // Increase the font size here
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
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                      _buildDialButton('1', '~'),
                      _buildDialButton('2', 'ABC'),
                      _buildDialButton('3', 'DEF'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDialButton('4', 'GHI'),
                      _buildDialButton('5', 'JKL'),
                      _buildDialButton('6', 'MNO'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDialButton('7', 'PQRS'),
                      _buildDialButton('8', 'TUV'),
                      _buildDialButton('9', 'WXYZ'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDialButton('*', ' '),
                      _buildDialButton('0', '+'),
                      _buildDialButton('#', ' '),
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
}
