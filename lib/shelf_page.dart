import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'bible_page.dart';
import 'core/tools.dart';

class ShelfPage extends StatefulWidget {
  @override
  ShelfState createState() => ShelfState();
}

class ShelfState extends State<ShelfPage> with AutomaticKeepAliveClientMixin<ShelfPage> {
  @override
  void initState() {
//  lines = tools!.get_Chapter();
    super.initState();
  }

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

  void selectBible(int index) {
////////////////    tools!.setCurrBible(index);
    print(index);
    l = false;
  }

  int current = 0;

  Widget _buildList() {
    final length = Provider.of<Data>(context, listen: false).tools!.bibles.length;
    return ListView.builder(
        itemCount: length,
        itemBuilder: (BuildContext content, int index) {
          final line = Provider.of<Data>(context, listen: false).tools!.bibles[index].name;
          return Container(
            color: Colors.white,
            child: ListTile(
              dense: true,
              title: Text(line, style: TextStyle(fontSize: 24.0)),
//            onTap: () => selectBible(index),
              leading: Radio<int>(
                value: index,
                groupValue: current,
                onChanged: (value) => setState(() {
//              debugPrint(_dataList[value!]);
                  current = value!;
                  selectBible(current);
                }),
              ),
            ),
          );
        });
  }

  @override
  bool get wantKeepAlive => true; // l;
}
