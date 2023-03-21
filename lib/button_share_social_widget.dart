import 'package:flutter/material.dart';

class ButtonShareSocialWidget extends StatelessWidget {
  final String title;
  final Image image;
  final Function onTap;

  const ButtonShareSocialWidget(
      {Key? key, required this.title, required this.image, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => onTap.call(),
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                side: BorderSide(
                    width: 1, color: Color.fromRGBO(217, 217, 217, 1))),
            child: Container(
              alignment: Alignment.center,
              height: 55,
              width: 55,
              color: Colors.white,
              child: image,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Text(title,
              style: TextStyle(
                  fontSize: 12, color: Color.fromRGBO(149, 142, 142, 1))),
        )
      ],
    );
  }
}
