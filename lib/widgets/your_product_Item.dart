import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fabric_shop/module/product.dart';

class YourProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgurl;
  final double price;

  YourProductItem(
      {@required this.id, @required this.title, @required this.imgurl, @required this.price});

  @override
  Widget build(BuildContext context) {
    final productConatiner = Provider.of<ProductsProvider>(context);

    return Card(

      elevation: 5,

      child: ListTile(

        leading: CircleAvatar(

          radius: 50,
          backgroundImage: AssetImage(imgurl),
          backgroundColor: Colors.transparent,
        ),

        title: Text(

          title,
          style: TextStyle(

            color: Theme.of(context).primaryColor,
          ),
        ),

        subtitle: Text(price.toStringAsFixed(2)),
        trailing: Container(

          width: 100,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(

                  Icons.edit,
                  color: Theme.of(context).accentColor,
                ),
                
              ),
              IconButton(
                onPressed: () {
                  productConatiner.removeOneItem(id);
                },
                icon: Icon(

                  Icons.delete_outline,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
