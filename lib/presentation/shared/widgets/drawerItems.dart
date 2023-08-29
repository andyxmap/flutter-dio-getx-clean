import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class SettingsItem extends StatefulWidget {
  SettingsItem(this.title, this.provider,{this.onTap});

  
  final String title;
  final ImageProvider provider;
  final void Function()?  onTap;

  @override
  _SettingsItemState createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    settingsItem(Widget child) => Styled.widget(child: child)
        .alignment(Alignment.center)
        .borderRadius(all: 15)
        .ripple()
        .backgroundColor(Colors.white, animate: true)
        .clipRRect(all: 25) // clip ripple
        .borderRadius(all: 25, animate: true)
        .elevation(
          pressed ? 0 : 20,
          borderRadius: BorderRadius.circular(25),
          shadowColor: Color(0x30000000),
        ) // shadow borderRadius
        .constrained(height: 50,width: 50)
        .padding(vertical: 12) // margin
        .gestures(
          onTapChange: (tapStatus) => setState(() => pressed = tapStatus),
          onTapDown: (details) => print('tapDown'),
          onTap: () => widget.onTap!(),
        )
        .scale(all: pressed ? 0.95 : 1.0, animate: true)
        .animate(const Duration(milliseconds: 150), Curves.easeOut);

    final Widget img = Image(image:widget.provider)
        .constrained(width: 20,height: 20)
        .padding(all: 5)
        .decorated(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromRGBO(79, 184, 209, 1),
        )
        .padding(left: pressed ? 10 : 15, right: 5);

    final Widget title = Text(
      widget.title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ).padding(bottom: 5);

    
    return settingsItem(
      <Widget>[
        img,
        <Widget>[
          title,
        ].toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ].toRow(),
    );
  }
}