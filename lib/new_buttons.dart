import 'package:flutter/material.dart';

class SomeButton extends StatelessWidget {
  const SomeButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          onPressed: null,
          child: Text("A raised Button"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              onPrimary: Colors.white), // onPrimary é a cor do texto.
          onPressed: null, child: Text("A raised Button - 2"),
        ),
        TextButton(
          style: TextButton.styleFrom(
              primary: Colors.orange), // primary é a cor principal do botão.
          onPressed: null, child: Text("A raised Button - 2"),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
              primary: Colors.orange, side: BorderSide(color: Colors.amber)),
          onPressed: null,
          child: Text("A raised Button - 2"),
        )
      ],
    );
  }
}
