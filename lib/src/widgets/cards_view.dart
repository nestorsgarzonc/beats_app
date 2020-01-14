import 'package:beats_app/src/models/producto_model.dart';
import 'package:beats_app/src/providers/productos_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CardsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productosProv = Provider.of<ProductosProvider>(context);
    return Container(
      width: double.infinity,
      height: 460,
      child: PageView(
        controller: PageController(viewportFraction: 0.8),
        children:
            productosProv.productos.map((prod) => _Card(prod: prod)).toList(),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  final ProductoModel prod;
  _Card({this.prod});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              _PrimeraDescripcion(prod),
              SizedBox(
                width: 55.0,
              ),
              _TarjetaDescripcion(prod),
            ],
          ),
          Positioned(
            top: 90,
            left: 50,
            child: Image.asset(
              'assets/${prod.url}',
              height: 220,
            ),
          ),
        ],
      ),
    );
  }
}

class _TarjetaDescripcion extends StatelessWidget {
  final ProductoModel prod;
  _TarjetaDescripcion(this.prod);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: size.width * 0.55,
          height: 340,
          color: Color(prod.color),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 25.0,
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      prod.titulo,
                      style: TextStyle(
                        color: Colors.white24,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      prod.subtitulo,
                      style: TextStyle(
                        color: Colors.white24,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Text(prod.nombre, style: TextStyle(color: Colors.white)),
                    Spacer(),
                    Icon(FontAwesomeIcons.heart, color: Colors.white),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Text(
                      '\$${prod.precio}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    width: 80,
                  ),
                  Container(
                    child: Center(
                      child: Text('Add to bag',
                          style: TextStyle(color: Colors.white)),
                    ),
                    width: 120.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(25)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PrimeraDescripcion extends StatelessWidget {
  final ProductoModel prod;
  _PrimeraDescripcion(this.prod);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: RotatedBox(
        quarterTurns: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.batteryFull, size: 15),
            SizedBox(width: 10),
            Text('${prod.bateria}-hour battery',
                style: TextStyle(fontSize: 12)),
            SizedBox(
              width: 30.0,
            ),
            Icon(FontAwesomeIcons.wifi, size: 15),
            SizedBox(width: 10),
            Text('Wireless', style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
