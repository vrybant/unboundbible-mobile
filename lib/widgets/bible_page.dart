import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/providers.dart';

class BiblePage extends ConsumerStatefulWidget {
  @override
  BibleState createState() => BibleState();
}

class BibleState extends ConsumerState<BiblePage> with AutomaticKeepAliveClientMixin<BiblePage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              print('pressed');
            },
            child: const Text('Button'),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.white,
        child: _buildList(),
      ),
    );
  }

  void _onTap() {
    ref.watch(chapterProvider.notifier).update();
  }

  Widget _buildList() {
    final lines = ref.watch(chapterProvider);
    return ListView.builder(
      itemCount: lines.length,
      itemBuilder: (BuildContext content, int index) {
        var line = lines[index];
        return Container(
          color: Colors.white,
          child: ListTile(
            title: Text(line, style: TextStyle(fontSize: 24.0)),
//            trailing: Icon(Icons.chevron_right),
            onTap: _onTap,
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true; // l;
}
