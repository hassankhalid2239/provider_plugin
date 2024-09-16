import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_plugin/Provider/favorite_provider.dart';

import 'data.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
        title: const Text(
          'List App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              favoriteProvider.addUser(
                  data[index]['name'], data[index]['image']);
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(data[index]['image']),
            ),
            title: Text(data[index]['name']),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
        height: 90,
        child: Consumer<FavoriteProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favoriteProvider.selectedUser.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 90,
                  child: Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage:
                              NetworkImage(value.selectedUser[index]['image']),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            value.deleteUser(index);
                          },
                          icon: const Icon(
                            Icons.clear,
                            // color: Colors.black,
                            size: 28,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          value.selectedUser[index]['name'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
