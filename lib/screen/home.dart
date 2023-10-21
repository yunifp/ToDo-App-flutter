import 'package:flutter/material.dart';
import 'package:wacana/constrants/color.dart';
import 'package:wacana/model/wacana.dart';
import 'package:wacana/widgets/wacana_item.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final wacanasList = Wacana.wacanaList();
  List<Wacana> _findWacana = [];
  final _wacanaController = TextEditingController();

  @override
  void initState() {
    _findWacana = wacanasList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna.mainColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Warna.mainColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu,
              color: Warna.textDark1,
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/Y.jpg'),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          'Wacana',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            color: Warna.textDark1,
                          ),
                        ),
                      ),
                      for (Wacana wacanaa in _findWacana.reversed)
                        WacanaItem(
                          wacana: wacanaa,
                          onWacanaChanged: _handleWacanaChange,
                          onDeletedItem: _deleteWacanaItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Warna.textinput,
                    boxShadow: const [
                      BoxShadow(
                        color: Warna.shadowColor,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _wacanaController,
                    decoration: InputDecoration(
                      hintText: 'What are you thinking about?',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  onPressed: () {
                    _addWacanaItem(_wacanaController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Warna.buttonElevate,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  void _handleWacanaChange(Wacana wacana) {
    setState(() {
      wacana.isDone = !wacana.isDone;
    });
  }

  void _deleteWacanaItem(String id) {
    setState(() {
      wacanasList.removeWhere((item) => item.id == id);
    });
  }

  void _addWacanaItem(String wacana) {
    setState(() {
      wacanasList.add(Wacana(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        wacanaText: wacana,
      ));
    });
    _wacanaController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<Wacana> results = [];
    if (enteredKeyword.isEmpty) {
      results = wacanasList;
    } else {
      results = wacanasList
          .where((item) => item.wacanaText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _findWacana = results;
    });
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Warna.secondaryColor, borderRadius: BorderRadius.circular(20)),
      child:  TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Warna.textDark3,
              size: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              maxWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(color: Warna.textDark2)),
      ),
    );
  }
}
