import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fabric_shop/module/product.dart';

class ViewProduct extends StatelessWidget {
  static const routeName = "/view_product_screen";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedProduct =
        Provider.of<ProductsProvider>(context, listen: false).findById(id);
    final mq = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        title: Text(selectedProduct.title),
      ),
      body: Column(

        children: <Widget>[

          Stack(

            children: <Widget>[

              Container(

                height: mq.size.height * 0.5,
                width: mq.size.width,
                child:

                  Image.asset(selectedProduct.imgUrl, fit: BoxFit.scaleDown),
                
              ),
            
            ],
          ),

          Padding(

            padding: const EdgeInsets.all(20),
            child: Center(
              
              child: Text(

                selectedProduct.description,
               
                style: TextStyle(

                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ) 
            ),
          ),
          Padding(

            padding: const EdgeInsets.all(2),

            child: Center(
              child: Text(
                
                "Price: ${selectedProduct.price.toString()}\$",

                style: TextStyle(

                  fontSize: 25,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
