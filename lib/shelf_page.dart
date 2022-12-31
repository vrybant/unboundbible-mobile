import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/providers.dart';
import 'core/tools.dart';

class ShelfPage extends ConsumerStatefulWidget {
  @override
  ShelfState createState() => ShelfState();
}

class ShelfState extends ConsumerState<ShelfPage> with AutomaticKeepAliveClientMixin<ShelfPage> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bible",
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          color: Colors.white,
          child: _buildList(),
        ));
  }

  void _onChanged(int index) {
    tools!.setCurrBible(index);
    ref.watch(chapterProvider.notifier).update();
    current = index;
    setState(() {});
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: tools!.bibles.length,
        itemBuilder: (BuildContext content, int index) {
          var line = tools!.bibles[index].name;
          return Container(
            color: Colors.white,
            child: ListTile(
              dense: true,
              title: Text(line, style: TextStyle(fontSize: 24.0)),
//            onTap: () => selectBible(index),
              leading: Radio<int>(
                value: index,
                groupValue: current,
                onChanged: (value) => _onChanged(value!),
              ),
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
