import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:unboundbible/controllers/shelf_controller.dart';

class ShelfPage extends StatelessWidget {
  const ShelfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return PlatformScaffold(
          appBar: PlatformAppBar(
            title: Center(
              child: PlatformText("Перевод"),
            ),
            cupertino: (context, platform) {
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

  Widget _listView(BuildContext context) {
    return Observer(
      builder: (_) {
        final lines = shelfController.list;
        final groupIndex = shelfController.index;
        return ListView.builder(
          itemCount: lines.length,
          itemBuilder: (_, int index) {
            var line = lines[index];
            return Container(
              color: Colors.white,
              child: PlatformListTile(
//                dense: true,
                title: Text(line, style: TextStyle(fontSize: 24.0)),
                leading: Radio<int>(
                  value: index,
                  groupValue: groupIndex,
                  onChanged: (_) {
                    shelfController.update(index);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
