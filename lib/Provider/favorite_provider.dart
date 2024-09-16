import 'package:flutter/cupertino.dart';

class FavoriteProvider with ChangeNotifier {
  final List _selectedUser = [];
  List get selectedUser => _selectedUser;

  void addUser(String name, String img) {
    _selectedUser.add({'name': name, 'image': img});
    notifyListeners();
  }

  void deleteUser(int index) {
    _selectedUser.removeAt(index);
    notifyListeners();
  }
}
