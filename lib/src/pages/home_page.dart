import 'package:beats_app/src/widgets/cards_view.dart';
import 'package:beats_app/src/widgets/custom_appbar.dart';
import 'package:beats_app/src/widgets/fondo_circular.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            FondoCircular(),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 3,
                    ),
                    CustomAppBar(),
                    _Header(),
                    CardsView(),
                  ],
                ),
              ),
            ),
            BuyBotton(),
          ],
        ),
      ),
    );
  }
}



class BuyBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
            width: size.width * 0.25,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Buy',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                SizedBox(
                  width: 5.0,
                ),
                Icon(
                  FontAwesomeIcons.arrowRight,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 45.0,
          ),
          Text('Beats',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0)),
          Text('By Dre',
              style: TextStyle(fontWeight: FontWeight.w100, fontSize: 18.0)),
        ],
      ),
    );
  }
}
