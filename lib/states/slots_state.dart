import 'package:flutter/material.dart';
import 'package:sumit_test/database/DatabaseHelper.dart';
import 'package:sumit_test/models/slot.dart';

class SlotState with ChangeNotifier {
  List<Slot?> _slots = [];
  DatabaseHelper _db = DatabaseHelper.instance;

  SlotState();

  List<Slot?> getSlots() => _slots;

  SlotState.instance() {
    init();
  }

  init() async {
    _slots = await _db.queryAllSlots();
    notifyListeners();
  }

  void updateSlot(Slot? slot) async {
    await _db.update(slot);
    init();
  }

  clearData() async {
    notifyListeners();
  }
}
