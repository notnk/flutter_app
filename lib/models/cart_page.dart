import 'package:flutter/material.dart';
import 'package:newtest/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;
  //collection of IDs in store Ids of each item
  final List<int> _itemIds =[];
  //setting the getter and the getter method
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog){
    assert(newCatalog!=null);
    _catalog=newCatalog;
  }
  //To get items in cart
  //List<Item> get items=> _itemIds.map((id) => _catalog.getById(id).toList());
  Iterable get items=> _itemIds.map((id) => _catalog.getById(id));
  //Get total Price
  num get totalPrice=>items.fold(0 , (total, current) => total+current.price);
  //add item
  void add(Item item){
    _itemIds.add(item.id);
  }
  //remove item
  void remove(Item item){
    _itemIds.remove(item.id);
  }
}