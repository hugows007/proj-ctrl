import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_ctrl/controllers/helpers/product.dart';
import 'package:proj_ctrl/data/model/product.dart';
import 'package:proj_ctrl/ui/components/products/product_list_item.dart';

class HomeHelper {
  final isSearching = false.obs;
  final key = GlobalKey<ScaffoldState>();
  final isLoading = false.obs;

  final searchQuery = TextEditingController().obs;
  final searchText = "".obs;

  HomeHelper() {
    searchQuery.value.addListener(() {
      if (searchQuery.value.text.isEmpty) {
        isSearching.value = false;
        searchText.value = "";
      } else {
        isSearching.value = true;
        searchText.value = searchQuery.value.text;
      }
    });
  }

  Widget appBarTitle = Text(
    "Bem vindo ao sistema",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );

  List<ProductListItemComponent> buildList({
    required ProductHelper productHelper,
  }) {
    return productHelper.products
        .map((element) => ProductListItemComponent(
      index: productHelper.products.indexOf(element),
              product: element,
              productHelper: productHelper,
            ))
        .toList();
  }

  List<ProductListItemComponent> buildSearchList({
    required ProductHelper productHelper,
  }) {
    if (searchText.isEmpty) {
      return productHelper.products
          .map((element) => ProductListItemComponent(
                index: productHelper.products.indexOf(element),
                product: element,
                productHelper: productHelper,
              ))
          .toList();
    } else {
      List<ProductDto> _searchList = [
        ProductDto(
          descricao: '',
          entrada: '',
          preco: '',
          saida: '',
        )
      ];
      for (int i = 0; i < productHelper.products.length; i++) {
        ProductDto product = productHelper.products.elementAt(i);
        if (product.descricao!
            .toLowerCase()
            .contains(searchText.toLowerCase())) {
          _searchList.add(product);
        }
      }
      return _searchList
          .map((element) => ProductListItemComponent(
        index: productHelper.products.indexOf(element),
                product: element,
                productHelper: productHelper,
              ))
          .toList();
    }
  }

  AppBar buildBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: appBarTitle,
      actions: <Widget>[
        IconButton(
          icon: actionIcon,
          onPressed: () {
            if (this.actionIcon.icon == Icons.search) {
              this.actionIcon = Icon(
                Icons.close,
                color: Colors.white,
              );
              this.appBarTitle = TextField(
                controller: searchQuery.value,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: "Procurar...",
                    hintStyle: TextStyle(color: Colors.white)),
              );
              handleSearchStart();
            } else {
              handleSearchEnd();
            }
          },
        ),
      ],
    );
  }

  void handleSearchEnd() {
    this.actionIcon = Icon(
      Icons.search,
      color: Colors.white,
    );
    this.appBarTitle = Text(
      "Bem vindo ao sistema",
      style: TextStyle(color: Colors.white),
    );
    isSearching.value = false;
    searchQuery.value.clear();
  }

  void handleSearchStart() {
    isSearching.value = true;
  }
}
