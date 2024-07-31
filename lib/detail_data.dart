import 'package:flutter/material.dart';
import 'package:flutter_grocery_ui/models/product_model.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int count = 0;

  void addCount() {
    setState(() {
      count = count + 1;
    });
  }

  void removeCount(){
    setState(() {
      if(count !=0) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Detail'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.product.name,
            style: const TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          Center(
            child: Hero(
              tag: widget.product.image,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.product.image),
                      fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  'Rp. ${widget.product.price}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  '/${widget.product.quantity}',
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.product.description,
                style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
          ),
          Container(
            color: Colors.grey,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: removeCount,
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.white70,
                          size: 30,
                        ),
                      ),
                      Text(
                        count.toString(),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 30.0,
                        ),
                      ),
                      IconButton(
                        onPressed: addCount,
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.white70,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                      width: 20.0,
                      ),
                      Center(
                        child: Container(
                          width: 160,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.green,
                          ),
                          child: const Center(
                            child: Text(
                              'Pesan',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
