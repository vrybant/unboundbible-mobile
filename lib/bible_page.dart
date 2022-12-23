import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/tools.dart';

bool l = true;

class BiblePage extends StatefulWidget {
  @override
  BibleState createState() => BibleState();
}

class BibleState extends State<BiblePage> with AutomaticKeepAliveClientMixin<BiblePage> {
  @override
  void initState() {
    /////////////////////    lines = tools!.get_Chapter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bible'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.white,
        child: _buildList(),
      ),
    );
  }

  void _onTap() {
    setState(() {
      l = false;
      print(l.toString());
    });
  }

  Widget _buildList() {
    final lines = Provider.of<Data>(context).tools!.get_Chapter();

    return ListView.builder(
      itemCount: lines.length,
      itemBuilder: (BuildContext content, int index) {
        final line = lines[index];
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
