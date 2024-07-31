import 'package:flutter/material.dart';
import 'package:flutter_grocery_ui/detail_data.dart';
import 'package:flutter_grocery_ui/models/product_model.dart';

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key, required this.product});
  final ProductModel product;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  int count = 1;

  void addCount() {
    setState(() {
      count = count + 1;
    });
  }

  void removeCount() {
    setState(() {
      if (count != 0) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(product: widget.product),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shadowColor: Colors.green,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Hero(
            tag: widget.product.image,
            child: SizedBox(
              width: 150,
              child: Image.asset(widget.product.image),
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Text(
            'Rp${widget.product.price}',
            style: const TextStyle(
              color: Colors.green,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            widget.product.name,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            widget.product.quantity,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            height: 4.0,
          ),
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(children: [
                Icon(
                  Icons.add_shopping_cart,
                  size: 20.0,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Text(
                  'Beli',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]),
              SizedBox(
                width: 10.0,
              ),
              Row(children: [
                Icon(
                  Icons.remove_circle_outline,
                  size: 20.0,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text('0'),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Icon(
                  Icons.add_circle_outline,
                  size: 20.0,
                  color: Colors.green,
                ),
              ])
            ],
          ),
        ]),
      ),
    );
  }
}
