import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:unboundbible/controllers/search_controller.dart';

// import 'package:flutter/material.dart' show SearchBar;

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return PlatformScaffold(
          appBar: PlatformAppBar(
            title: Center(
              child: _searchBar(context),
            ),
            cupertino: (_, __) {
              return CupertinoNavigationBarData(
                transitionBetweenRoutes: false,
              );
            },
            material: (_, __) {
              return MaterialAppBarData(
                backgroundColor: Colors.blueAccent,
              );
            },
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
      child: PlatformTextField(
        textAlignVertical: TextAlignVertical.bottom,
        cursorColor: Colors.grey,
        onSubmitted: (value) => searchController.update(value),
        material: (_, __) {
          return MaterialTextFieldData(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              prefixIcon: Container(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.search_rounded),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _listView(BuildContext context) {
    final lines = searchController.content;
    return ListView.builder(
      key: ObjectKey(lines.hashCode),
      itemCount: lines.length,
      itemBuilder: (BuildContext content, int index) {
        var line = lines[index];
        return Container(
          color: Colors.white,
          child: ListTile(
            title: Text(line, style: TextStyle(fontSize: 24.0)),
            onTap: () {},
          ),
        );
      },
    );
  }
}
