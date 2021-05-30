import 'package:flutter/material.dart';
import 'package:proj_ctrl/controllers/helpers/product.dart';
import 'package:proj_ctrl/data/model/product.dart';
import 'package:sizer/sizer.dart';

class ProductsListComponent extends StatelessWidget {
  final ProductHelper productHelper;

  ProductsListComponent({
    required this.productHelper,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: productHelper.products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
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
                                        padding:
                                            EdgeInsets.only(left: 0, top: 5),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                                '${productHelper.products[index].descricao}'),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (productHelper
                                              .products[index].entrada !=
                                          '0')
                                        Text(
                                            'Entrada: ${productHelper.products[index].entrada}'),
                                      if (productHelper.products[index].saida !=
                                          '0')
                                        Text(
                                            'Saída: ${productHelper.products[index].saida}'),
                                      if (productHelper.products[index].preco !=
                                          '0')
                                        Text(
                                            'Valor: ${productHelper.products[index].preco}'),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
