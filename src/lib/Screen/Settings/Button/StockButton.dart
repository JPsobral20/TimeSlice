import 'package:flutter/material.dart';


class StockButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title:Text("Stock"),
                content: Text("Something"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text("Back"),
                  ),
                ],
              ),
            );
          },

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightGreen,
            padding: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Stock",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          )
      ),
    );
  }
}