import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
//import 'package:go_router/go_router.dart';
import 'package:unboundbible/controllers/main_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: _searchBar(context),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          body: Container(
            color: Colors.white,
            child: _listView(context),
          ),
        );
      },
    );
  }

  Widget _searchBar(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        textAlignVertical: TextAlignVertical.bottom,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
          prefixIcon: Container(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.search_rounded),
          ),
        ),
        onSubmitted: (value) => print(value),
      ),
    );
  }

  Widget _listView(BuildContext context) {
    return Observer(
      builder: (_) {
        final lines = mainController.content;
        return ListView.builder(
          key: ObjectKey(lines.hashCode),
          itemCount: 2, //lines.length,
          itemBuilder: (BuildContext content, int index) {
            var line = lines[index];
            return Container(
              color: Colors.white,
              child: ListTile(
                  title: Text(line, style: TextStyle(fontSize: 24.0)),
                  onTap: () {
//                ref.context.push('/details');
                  }),
            );
          },
        );
      },
    );
  }
}
