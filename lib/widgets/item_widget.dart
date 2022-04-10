import 'package:flutter/material.dart';
import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {

  final Item item;

  const ItemWidget({Key? key, required this.item}) :assert(item!=null) , super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: const StadiumBorder(),
        child: ListTile(
          onTap: (){
            print( '${item.name} was pressed');
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text('\$${item.price}',style: const TextStyle(fontWeight: FontWeight.bold),textScaleFactor: 1.5,),
        ),
      ),
    );
  }
}