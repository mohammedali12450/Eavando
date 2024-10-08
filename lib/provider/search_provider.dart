import 'package:flutter/material.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/base/api_response.dart';
import 'package:flutter_axtro_soft_ecommerce/data/model/response/product_model.dart';
import 'package:flutter_axtro_soft_ecommerce/data/repository/search_repo.dart';
import 'package:flutter_axtro_soft_ecommerce/helper/api_checker.dart';

class SearchProvider with ChangeNotifier {
  final SearchRepo searchRepo;
  SearchProvider({required this.searchRepo});

  List<String> _historyList = [];
  List<String> get historyList => _historyList;
  int _filterIndex = 0;
  int get filterIndex => _filterIndex;

  List<Product>? _searchProductList;
  List<Product>? _filterProductList;
  bool _isClear = true;
  String _searchText = '';

  List<Product>? get searchProductList => _searchProductList;
  List<Product>? get filterProductList => _filterProductList;
  bool get isClear => _isClear;
  String get searchText => _searchText;

  void setFilterIndex(int index) {
    _filterIndex = index;
    notifyListeners();
  }

  void sortSearchList(double startingPrice, double endingPrice) {
    _searchProductList = [];
    if (startingPrice > 0 && endingPrice > startingPrice) {
      _searchProductList?.addAll(_filterProductList
              ?.where((product) =>
                  (product.unitPrice ?? 0) > startingPrice &&
                  (product.unitPrice ?? 0) < endingPrice)
              .toList() ??
          []);
    } else {
      _searchProductList?.addAll(_filterProductList ?? []);
    }

    if (_filterIndex == 0) {
    } else if (_filterIndex == 1) {
      _searchProductList?.sort((a, b) =>
          (a.name ?? "").toLowerCase().compareTo(b.name?.toLowerCase() ?? ""));
    } else if (_filterIndex == 2) {
      _searchProductList?.sort((a, b) =>
          (a.name ?? "").toLowerCase().compareTo(b.name?.toLowerCase() ?? ""));
      Iterable<Product>? iterable = _searchProductList?.reversed;
      _searchProductList = iterable?.toList();
    } else if (_filterIndex == 3) {
      _searchProductList
          ?.sort((a, b) => (a.unitPrice ?? 0).compareTo(b.unitPrice ?? 0));
    } else if (_filterIndex == 4) {
      _searchProductList
          ?.sort((a, b) => (a.unitPrice ?? 0).compareTo(b.unitPrice ?? 0));
      Iterable<Product> iterable = _searchProductList?.reversed ?? [];
      _searchProductList = iterable.toList();
    }

    notifyListeners();
  }

  void setSearchText(String text) {
    _searchText = text;
    notifyListeners();
  }

  void cleanSearchProduct() {
    _searchProductList = [];
    _isClear = true;
    _searchText = '';
    notifyListeners();
  }

  void searchProduct(String query, BuildContext context) async {
    print('====koybar=====>');
    _searchText = query;
    _isClear = false;
    _searchProductList?.clear();
    _filterProductList?.clear();
    notifyListeners();

    ApiResponse apiResponse = await searchRepo.getSearchProductList(query);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      if (query.isEmpty) {
        _searchProductList = [];
        _filterProductList = [];
      } else {
        _searchProductList = [];
        _searchProductList?.addAll(
          ProductModel.fromJson(apiResponse.response!.data).products ?? [],
        );
        _filterProductList = [];
        _filterProductList?.addAll(
          ProductModel.fromJson(apiResponse.response!.data).products ?? [],
        );
      }
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }

  void initHistoryList() {
    _historyList = [];
    _historyList.addAll(searchRepo.getSearchAddress());
  }

  void saveSearchAddress(String searchAddress) async {
    searchRepo.saveSearchAddress(searchAddress);
    if (!_historyList.contains(searchAddress)) {
      _historyList.add(searchAddress);
    }
    notifyListeners();
  }

  void clearSearchAddress() async {
    print('search tap');
    searchRepo.clearSearchAddress();
    _historyList = [];
    notifyListeners();
  }
}
