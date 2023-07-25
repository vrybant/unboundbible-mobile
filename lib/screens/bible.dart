import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:unboundbible/controllers/main_controller.dart';

class BiblePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        final info = mainController.infoString;
        return PlatformScaffold(
          appBar: PlatformAppBar(
            title: PlatformTextButton(
              child: Center(
                child: Text(info),
              ),
              onPressed: () => context.go('/titles'),
              padding: const EdgeInsets.all(8),
              cupertino: (_, __) {
                return CupertinoTextButtonData(
                  minSize: 30,
                );
              },
              material: (_, __) {
                return MaterialTextButtonData(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    foregroundColor: Colors.white,
                  ),
                );
              },
            ),
            cupertino: (_, __) {
              return CupertinoNavigationBarData(
                transitionBetweenRoutes: false,
              );
            },
            material: (_, __) {
              return MaterialAppBarData(
                elevation: 2,
                shadowColor: Theme.of(context).shadowColor,
              );
            },
          ),
          body: _listView(context),
        );
      },
    );
  }

  Widget _listView(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        final lines = mainController.content;
        return ListView.builder(
          key: ObjectKey(lines.hashCode),
          itemCount: lines.length,
          itemBuilder: (BuildContext content, int index) {
            var line = lines[index];
            return Container(
              color: Colors.white,
              child: ListTile(
                title: Text(line, style: TextStyle(fontSize: 24.0)),
//              onTap: () => context.push('/details'),
              ),
            );
          },
        );
      },
    );
  }
}
