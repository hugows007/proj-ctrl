import 'package:flutter/material.dart';
import 'package:proj_ctrl/controllers/helpers/product.dart';
import 'package:proj_ctrl/data/model/product.dart';
import 'package:sizer/sizer.dart';

class ProductListComponent extends StatelessWidget {
  final int index;
  final ProductDto product;
  final ProductHelper productHelper;

  ProductListComponent({
    required this.index,
    required this.product,
    required this.productHelper,
  });

  @override
  Widget build(BuildContext context) {
    return product.descricao!.isNotEmpty
        ? GestureDetector(
            onTap: () => productHelper.sendToInputProduct(index),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              height: 20.0.h,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Stack(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 0, top: 5),
                                  child: Row(
                                    children: <Widget>[
                                      Text('${product.descricao}'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                                if (product.entrada != '0')
                                  Text('Entrada: ${product.entrada}'),
                                if (product.saida != '0')
                                  Text('Saída: ${product.saida}'),
                                if (product.preco != '0')
                                  Text('Valor: ${product.preco}'),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2.0,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : SizedBox();
  }
}
