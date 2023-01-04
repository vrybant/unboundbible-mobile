import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/providers.dart';

class TitlesPage extends ConsumerStatefulWidget {
  @override
  TitlesState createState() => TitlesState();
}

class TitlesState extends ConsumerState<TitlesPage> with AutomaticKeepAliveClientMixin<TitlesPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Titles"),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          color: Colors.white,
          child: _buildList(),
        ));
  }

  void _onChanged(int index) {
    ref.read(titlesIndexProvider.notifier).update(index);
    ref.read(currentProvider.notifier).update();
    ref.read(chapterProvider.notifier).update();
  }

  Widget _buildList() {
    final lines = ref.read(titlesProvider);
    final int groupIndex = ref.watch(titlesIndexProvider);
    return ListView.builder(
        itemCount: lines.length,
        itemBuilder: (BuildContext content, int index) {
          var line = lines[index];
          return Container(
            color: Colors.white,
            child: ListTile(
              dense: true,
              title: Text(line, style: TextStyle(fontSize: 24.0)),
              //          onTap: () => selectBible(index),
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
