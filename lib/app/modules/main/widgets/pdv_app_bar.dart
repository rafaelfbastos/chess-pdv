import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:chess_pdv/app/modules/main/widgets/app_bar_leading.dart';
import 'package:flutter/material.dart';

class PdvAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const PdvAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:context.primaryColor,
      leading: const AppBarLeading(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      title:  Row(
        children: [
          Text(
            title,
            style:  const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
