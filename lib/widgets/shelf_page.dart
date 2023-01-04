import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/providers.dart';

class ShelfPage extends ConsumerStatefulWidget {
  @override
  ShelfState createState() => ShelfState();
}

class ShelfState extends ConsumerState<ShelfPage> with AutomaticKeepAliveClientMixin<ShelfPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Shelf"),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          color: Colors.white,
          child: _buildList(),
        ));
  }

  void _onChanged(int index) {
    ref.read(shelfIndexProvider.notifier).update(index);
    ref.read(chapterProvider.notifier).update();
    ref.read(currentProvider.notifier).update();
  }

  Widget _buildList() {
    final lines = ref.read(shelfProvider);
    final int groupIndex = ref.watch(shelfIndexProvider);
    return ListView.builder(
        itemCount: lines.length,
        itemBuilder: (BuildContext content, int index) {
          var line = lines[index];
          return Container(
            color: Colors.white,
            child: ListTile(
              dense: true,
              title: Text(line, style: TextStyle(fontSize: 24.0)),
//            onTap: () => selectBible(index),
              leading: Radio<int>(
                value: index,
                groupValue: groupIndex,
                onChanged: (value) => _onChanged(value!),
              ),
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true;
}
