import 'package:flutter/material.dart';
import 'package:proj_ctrl/controllers/helpers/product.dart';
import 'package:proj_ctrl/data/model/product.dart';
import 'package:sizer/sizer.dart';

class ProductListItemComponent extends StatelessWidget {
  final int index;
  final ProductDto product;
  final ProductHelper productHelper;

  ProductListItemComponent({
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
              height: productHelper.getHeight(product),
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Container(
                  width: double.infinity,
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
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '#${product.id} - ${product.descricao}',
                                          style: TextStyle(
                                            fontSize: 15.0.sp,
                                          ),
                                        ),
                                      ),
                                      if (product.entrada != '0')
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Divider(
                                              height: 20,
                                              thickness: 1,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(4.0),
                                              child: Text(
                                                'Entrada: ${product.entrada}',
                                                style: TextStyle(
                                                  fontSize: 11.0.sp,
                                                ),
                                              ),
                                            ),
                                            if (product.saida != '0')
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Saída: ${product.saida}',
                                                  style: TextStyle(
                                                    fontSize: 11.0.sp,
                                                  ),
                                                ),
                                              ),
                                            if (product.preco != '0')
                                              Padding(
                                                padding: const EdgeInsets.all(4.0),
                                                child: Text(
                                                  'Valor: ${product.preco}',
                                                  style: TextStyle(
                                                    fontSize: 11.0.sp,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                    ],
                                  ),
                                ),
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
