import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:chess_pdv/app/modules/main/widgets/app_bar_leading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:searchfield/searchfield.dart';

class PdvAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<String> guestList;
  const PdvAppBar({super.key, required this.title, required this.guestList});

  @override
  Widget build(BuildContext context) {

    final TextEditingController _searchController = TextEditingController();

    return Observer(
        builder: (context) => AppBar(
              backgroundColor: context.primaryColor,
              leading: const AppBarLeading(),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 500,
                    child: SearchField<String>(
                      suggestions: guestList
                          .map((e) => SearchFieldListItem(
                                e,
                                item: e,
                                child: Text(e,
                                    style: TextStyle(
                                        color: context.secondaryColor)),
                              ))
                          .toList(),
                      searchStyle: TextStyle(color: context.secondaryColor),
                      controller: _searchController,
                      searchInputDecoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon:  Icon(Icons.search, color: Colors.grey[500]),
                          onPressed: () =>_searchController.clear(),
                        ),
                        fillColor: context.backgroudColor,
                        isDense: true,
                        filled: true,
                        hintText: 'Buscar hóspede',
                        hintStyle: TextStyle(color: Colors.grey[500]),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
