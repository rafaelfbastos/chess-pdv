import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:chess_pdv/app/core/widgets/room_card.dart';
import 'package:chess_pdv/app/modules/main/pdv/pdv_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FrameGridRooms extends StatelessWidget {
  final PdvPageController _controller;

  const FrameGridRooms({super.key, required PdvPageController controller})
      : _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "QUARTOS OCUPADOS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: context.secondaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  children: _controller.roomBusy
                      .map<RoomCard>((room) => RoomCard(
                          room: room,
                          onTap: () =>
                              _controller.setCurrentAccommodation(room)))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
