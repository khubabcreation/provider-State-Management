import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Favourite_provider.dart';

class Fav_item_Screen extends StatefulWidget {
  const Fav_item_Screen({Key? key}) : super(key: key);

  @override
  State<Fav_item_Screen> createState() => _Fav_item_ScreenState();
}

class _Fav_item_ScreenState extends State<Fav_item_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('these are my fav items'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavouriteProvider>(
              builder: (context, ref, child) {
                return ListView.builder(
                  itemCount: ref.numberOfIndex.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        if (ref.numberOfIndex.contains(index)) {
                          ref.removeIndex(index);
                        } else {
                          ref.setIndex(index);
                        }
                      },
                      title: Text('item   $index'),
                      leading: Icon(ref.numberOfIndex.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
