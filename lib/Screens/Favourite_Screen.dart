import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_again/Screens/Fav_Item_Screen.dart';

import '../Provider/Favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print('builde has been called');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Screen '),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Fav_item_Screen(),
                    ));
              },
              icon: Icon(Icons.favorite)),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                  builder: (context, ref, child) {
                    return ListTile(
                      onTap: () {
                        if (ref.numberOfIndex.contains(index)) {
                          ref.removeIndex(index);
                        } else {
                          ref.setIndex(index);
                        }
                      },
                      title: Text('items  $index'),
                      trailing: Icon(ref.numberOfIndex.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
