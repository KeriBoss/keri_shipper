import 'package:flutter/material.dart';
import 'package:keri_shipper/constants/color_constants.dart';
import 'package:keri_shipper/constants/color_palette.dart';

class HeaderWidget extends StatefulWidget {
  final double _height;
  final bool _showIcon;
  final IconData _icon;

  const HeaderWidget(this._height, this._showIcon, this._icon, {Key? key})
      : super(key: key);

  @override
  _HeaderWidgetState createState() =>
      _HeaderWidgetState(_height, _showIcon, _icon);
}

class _HeaderWidgetState extends State<HeaderWidget> {
  double _height;
  bool _showIcon;
  IconData _icon;

  _HeaderWidgetState(this._height, this._showIcon, this._icon);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      child: Stack(
        children: [
          ClipPath(
            child: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.4),
                      Color.fromARGB(255, 229, 229, 227).withOpacity(0.4),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
            clipper: new ShapeClipper([
              Offset(width / 5, _height),
              Offset(width / 10 * 5, _height - 60),
              Offset(width / 5 * 4, _height + 20),
              Offset(width, _height - 18)
            ]),
          ),
          ClipPath(
            child: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor.withOpacity(0.4),
                      ColorPalette.fourColor,
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
            clipper: new ShapeClipper([
              Offset(width / 3, _height + 20),
              Offset(width / 10 * 8, _height - 60),
              Offset(width / 5 * 4, _height - 60),
              Offset(width, _height - 20)
            ]),
          ),
          ClipPath(
            child: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      ColorConstants.fourColor,
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
            clipper: new ShapeClipper([
              Offset(width / 5, _height),
              Offset(width / 2, _height - 40),
              Offset(width / 5 * 4, _height - 80),
              Offset(width, _height - 20)
            ]),
          ),
          Positioned(
            top: 0,
            bottom: _height / 8,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    color: Colors.white,
                    child: SizedBox(
                        child: Image.asset(
                      "assets/images/logo.png",
                      height: 150,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  List<Offset> _offsets = [];
  ShapeClipper(this._offsets);
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height - 20);

    // path.quadraticBezierTo(size.width/5, size.height, size.width/2, size.height-40);
    // path.quadraticBezierTo(size.width/5*4, size.height-80, size.width, size.height-20);

    path.quadraticBezierTo(
        _offsets[0].dx, _offsets[0].dy, _offsets[1].dx, _offsets[1].dy);
    path.quadraticBezierTo(
        _offsets[2].dx, _offsets[2].dy, _offsets[3].dx, _offsets[3].dy);

    // path.lineTo(size.width, size.height-20);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
