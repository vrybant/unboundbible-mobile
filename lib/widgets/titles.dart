import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

import 'package:unboundbible/core/tools.dart';

class TitlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text("Книги"),
          // actions: <Widget>[
          //   IconButton(
          //     icon: const Icon(Icons.arrow_drop_down_circle),
          //     tooltip: 'Show Tooltip',
          //     onPressed: () {},
          //   ),
          // ],
          material: (_, __) {
            return MaterialAppBarData(
              centerTitle: true,
              backgroundColor: Colors.blueAccent,
            );
          },
        ),
        body: Container(
          color: Colors.white,
          child: _listView(context),
        ));
  }

  Widget _listView(BuildContext context) {
    final lines = GetIt.I<Tools>().getTitles();
    return ListView.builder(
      itemCount: lines.length,
      itemBuilder: (BuildContext content, int index) {
        var line = lines[index];
        return Container(
          color: Colors.white,
          child: ListTile(
            dense: true,
            title: Text(line, style: TextStyle(fontSize: 24.0)),
            onTap: () {
              final book = index + 1;
              context.go('/titles/chapters', extra: book);
            },
          ),
        );
      },
    );
  }
}