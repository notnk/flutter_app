import 'package:newtest/core/store.dart';
import 'package:newtest/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // static final cartModel= CartModel._internal();
  // CartModel._internal();
  // factory CartModel()=>cartModel;

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
  List<Item> get items=> _itemIds.map((id) => _catalog.getById(id)).toList();
  //Get total Price
  num get totalPrice=>items.fold(0 , (total, current) => total+current.price);
  //add item
  // void add(Item item){
  //   _itemIds.add(item.id);
  // }
  //remove item
  // void remove(Item item){
  //   _itemIds.remove(item.id);
  // }
}
class AddMutation extends VxMutation<MyStore>{
  late final Item item;
  AddMutation(this.item);
  @override
  perform() {
      store!.cart._itemIds.add(item.id);
  }
}
class RemoveMutation extends VxMutation<MyStore>{
  late final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}