import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:go_router/go_router.dart';

class ColorDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        backgroundColor: Colors.black,
        title: Text('Detail'),
      ),
      body: PlatformTextButton(
        child: Text("***********"),
        onPressed: () {
          context.go('/titles');
        },
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}
