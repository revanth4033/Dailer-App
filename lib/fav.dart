// fav.dart

import 'package:flutter/material.dart';
import 'cont.dart';
import 'hist.dart';

class FavPage extends StatefulWidget {
  @override
  _FavPageState createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  int _currentIndex = 2; // Set the current index to 2 for 'Favorites'

  List<String> row1Favorites = [
    'Daddy',
    'Mummy',
    'Sissy',
  ];

  List<String> row2Favorites = [
    'Bro',
  ];

  List<String> frequentsList = [
    'Daddy',
    'Tom',
    // Add any other contact from cont.dart
  ];

  Map<String, String> contactImages = {
    'Daddy': 'assets/images/dad.png',
    'Mummy': 'assets/images/mom.png',
    'Sissy': 'assets/images/sis.png',
    'Cousin1': 'assets/images/cousin1.png',
    'Aunt': 'assets/images/aunt.png',
    'Tom': 'assets/images/tom.png',
    'Bro': 'assets/images/bro.png',
  };

  Map<String, Map<String, double>> imageDimensions = {
    'Daddy': {'width': 100.0, 'height': 100.0},
    'Mummy': {'width': 100.0, 'height': 100.0},
    'Sissy': {'width': 100.0, 'height': 100.0},
    'Bro': {'width': 100.0, 'height': 100.0},
    'Friend1': {'width': 100.0, 'height': 100.0},
    'Friend2': {'width': 100.0, 'height': 100.0},
  };

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
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search favorites',
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
                  'Favorites',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...row1Favorites.map((contactName) {
                String imagePath = contactImages[contactName] ?? 'images/default.png';
                double width = imageDimensions[contactName]?['width'] ?? 100.0;
                double height = imageDimensions[contactName]?['height'] ?? 100.0;

                return Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Column(
                      children: [
                        Image.asset(imagePath, width: width, height: height),
                        SizedBox(height: 4.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              contactName,
                              style: TextStyle(color: Colors.white, fontSize: 16.0),
                            ),
                            SizedBox(width: 2.0),
                            Icon(
                              Icons.call,
                              color: Colors.white,
                              size: 16.0,
                            ),
                          ],
                        ),
                        SizedBox(height: 1.0),
                        Text(
                          'mobile',
                          style: TextStyle(color: Colors.grey, fontSize: 12.0),
                        ),
                      ],
                    ),
                  ],
                );
              }).toList(),
            ],
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...row2Favorites.map((contactName) {
                  String imagePath = contactImages[contactName] ?? 'images/default.png';
                  double width = imageDimensions[contactName]?['width'] ?? 100.0;
                  double height = imageDimensions[contactName]?['height'] ?? 100.0;

                  return Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Column(
                        children: [
                          Image.asset(imagePath, width: width, height: height),
                          SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                contactName,
                                style: TextStyle(color: Colors.white, fontSize: 16.0),
                              ),
                              SizedBox(width: 2.0),
                              Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 16.0,
                              ),
                            ],
                          ),
                          SizedBox(height: 1.0),
                          Text(
                            'mobile',
                            style: TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                        ],
                      ),
                    ],
                  );
                }).toList(),
                SizedBox(height: 8.0),
                Text(
                  'Frequents',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...frequentsList.map((contactName) {
                      String imagePath = contactImages[contactName] ?? 'images/default.png';
                      double width = imageDimensions[contactName]?['width'] ?? 100.0;
                      double height = imageDimensions[contactName]?['height'] ?? 100.0;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(imagePath),
                              radius: 20.0,
                            ),
                            SizedBox(width: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contactName,
                                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                                ),
                                SizedBox(height: 2.0),
                                Text(
                                  'Mobile +91 8465189350', // Replace with the actual mobile number
                                  style: TextStyle(color: Colors.grey, fontSize: 12.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ],
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
          });

          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CodiaPage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HistoryPage()),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialPad();
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.dialpad),
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
