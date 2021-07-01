import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sumit_test/models/slot.dart';
import 'package:sumit_test/screens/slot_details.dart';
import 'package:sumit_test/states/slots_state.dart';

class SlotsScreen extends StatefulWidget {
  SlotsScreen({Key? key}) : super(key: key);

  @override
  _SlotsScreenState createState() {
    return _SlotsScreenState();
  }
}

class _SlotsScreenState extends State<SlotsScreen>
    with AfterLayoutMixin<SlotsScreen> {
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void afterFirstLayout(BuildContext context) => _init();

  void _init() {
    Provider.of<SlotState>(context, listen: false).init();
  }

  void _pickImage() async {
    final PickedFile? pickedFile =
        await _picker.getImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slots"),
        actions: [
          TextButton(
              onPressed: _pickImage,
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ))
        ],
      ),
      body: Consumer<SlotState>(builder: (_, slotsState, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: slotsState.getSlots().length,
          padding: EdgeInsets.symmetric(vertical: 5),
          itemBuilder: (BuildContext context, int i) {
            Slot? slot = slotsState.getSlots()[i];
            return Container(
              margin: EdgeInsets.only(bottom: 5, left: 5, right: 5),
              color: slot!.name != null ? Colors.red : Colors.grey[300],
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SlotDetails(
                              slot: slot,
                            )),
                  ).then((value) {
                    setState(() {});
                  });
                },
                title: Text(
                  "${slot.slot_start ?? ""} - ${slot.slot_end ?? ""}",
                  style: TextStyle(
                    color: slot.name != null ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
