import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  final Widget? title;
  final Widget? leading;
  final Widget? subtitle;
  final VoidCallback? updateOnPressed;
  final VoidCallback? deleteOnPressed;

  const CardCustom({
    super.key,
    this.title,
    this.leading,
    this.subtitle,
    this.updateOnPressed,
    this.deleteOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyIconButton(
              onPressed: updateOnPressed,
              icon: Icons.edit,
              color: Colors.blueGrey,
            ),
            MyIconButton(
              onPressed: deleteOnPressed,
              icon: Icons.delete,
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  const MyIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 18,
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}
