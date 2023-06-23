import 'package:flutter/material.dart';
import 'package:json_test/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel product;

  const ProductItemWidget({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 75,
              height: 75,
              child: Image(
                image: NetworkImage(
                  '${product.imageUrl}',
                ),
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(
                bottom: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 8),
                    child: Text(
                      '${product.name}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 8, top: 16),
                    child: Text(
                      "\$ ${product.price}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
