import 'package:flutter/material.dart';
import 'package:grocery/chart/Chart.dart';
import 'package:grocery/home/Home.dart';
import 'package:grocery/product/ProductCard.dart';
import 'package:grocery/product/ProductDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
      onGenerateRoute: (setting) {
        if (setting.name == ProductDetail.routeName) {
          final args = setting.arguments as ProductArguments;

          return MaterialPageRoute(builder: (context) {
            return ProductDetail(
                merk: args.merk,
                category: args.category,
                price: args.price,
                weight: args.weight,
                imageUrl: args.imageUrl);
          });
        }

        if (setting.name == Chart.routeName) {
          return MaterialPageRoute(builder: (context) {
            return Chart();
          });
        }

        assert(false, 'need to implement ${setting.name}');
        return null;
      },
    );
  }
}
