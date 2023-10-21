import 'package:flutter/material.dart';
import 'package:wacana/constrants/color.dart';
import 'package:wacana/model/wacana.dart';

class WacanaItem extends StatelessWidget {
  final Wacana wacana;
  final onWacanaChanged;
  final onDeletedItem;

  const WacanaItem({super.key, required this.wacana, required this.onWacanaChanged, required this.onDeletedItem});



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20 ),
      child: ListTile(
        onTap: () {
          onWacanaChanged(wacana);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Warna.secondaryColor,
        leading: Icon(
          wacana.isDone ? Icons.check_box : Icons.check_box_outline_blank_outlined,
          color: Warna.tdBlue,
        ),
        title: Text(
          wacana.wacanaText!,
          style: TextStyle(
            fontSize: 16,
            color: Warna.textDark2,
            decoration: wacana.isDone? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Warna.tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.delete_rounded),
            onPressed: () {
              onDeletedItem(wacana.id);
            },

          ),
        ),
      ),
    );
  }
}
