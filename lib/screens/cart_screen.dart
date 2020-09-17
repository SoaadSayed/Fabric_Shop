import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fabric_shop/module/cart.dart';
import 'package:fabric_shop/widgets/cart_item.dart';
import 'package:fabric_shop/module/order.dart';
import 'package:fabric_shop/widgets/side_drawer.dart';

class CartScreen extends StatelessWidget {

  static const routeName = "/cart_screen";
  @override
  Widget build(BuildContext context) {

    final cartContainer = Provider.of<CartProvider>(context);
    final cartItems = cartContainer.items;
    final mq = MediaQuery.of(context);
    return Scaffold(

      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(

        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(

          "Your Cart",
          style: TextStyle(

            fontWeight: FontWeight.bold, 
            fontSize: 25, 
            color: Colors.white
          ),
        ),
      ),

      drawer: SideDrawer(),

      body: Column(

        children: <Widget>[

          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (ctx, i) => Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: CartItemWidget(
                  title: cartItems.values.toList()[i].title,
                  imgurl: cartItems.values.toList()[i].imgurl,
                  price: cartItems.values.toList()[i].price,
                  amount: cartItems.values.toList()[i].quantity,
                  id: cartItems.values.toList()[i].id,
                ),
              ),
            ),
          ),
          Container(

            padding: EdgeInsets.all(20),
            height: mq.size.height * 0.15,
            width: mq.size.width,
            color: Colors.white,
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(

                      "Total",
                      style: TextStyle(

                        color: Colors.grey, 
                        fontSize: 25
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(

                      "\$${cartContainer.totalMoney.toStringAsFixed(2)}",
                      style: TextStyle(
                        
                        color: Theme.of(context).primaryColor, 
                        fontSize: 20
                      ),
                    )
                  ],
                ),
                Container(

                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      if(cartContainer.totalMoney == 0){
                        return;
                      }
                      Provider.of<OrderProvider>(context, listen: false)
                          .addOrders(cartContainer.items.values.toList(),
                              cartContainer.totalMoney, 1);
                      cartContainer.clear();
                    },
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(

                            "Checkout",
                            style: TextStyle(

                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Icon(

                          Icons.arrow_forward, 
                          color: Colors.white
                        ),
                      ],
                    ),
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
