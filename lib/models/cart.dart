import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;

  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item catalog;
  AddMutation({required this.catalog});
  @override
  perform() {
    store!.cart._itemIds.add(catalog.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item catalog;
  RemoveMutation({required this.catalog});
  @override
  perform() {
    store!.cart._itemIds.remove(catalog.id);
  }
}
