import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proj_ctrl/controllers/home.dart';

class HomeHelper {
  TextEditingController searchQueryController = TextEditingController();

  final isSearching = false.obs;
  final searchQuery = "Nome do produto".obs;

  final isLoading = false.obs;

  Widget buildSearchField() {
    return TextField(
      controller: searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Digite o nome do produto",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery(query),
    );
  }

  List<Widget> buildActions() {
    if (isSearching.isTrue) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (searchQueryController.text.isEmpty) {
              Navigator.pop(Get.overlayContext!);
              return;
            }
            clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: startSearch,
      ),
    ];
  }

  void startSearch() {
    ModalRoute.of(HomeController.to.buildContext!)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));

    isSearching.value = true;
  }

  void updateSearchQuery(String newQuery) {
    searchQuery.value = newQuery;
  }

  void stopSearching() {
    clearSearchQuery();
    isSearching.value = false;
  }

  void clearSearchQuery() {
    searchQueryController.clear();
    updateSearchQuery("");
  }
}