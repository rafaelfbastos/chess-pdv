import 'package:chess_pdv/app/model/room_exibhition_model.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final RoomExibhitionModel room;
  final Function() onTap;

  const RoomCard({super.key, required this.room, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: 'Abir comanda do quarto ${room.description}',
        child: GestureDetector(
          onTap: onTap,
          child: Stack(
            children: [
              Image.asset(
                'assets/img/diaria.png',
                width: 150,
                height: 150,
              ),
              Positioned(
                top: 108,
                child: SizedBox(
                  width: 150,
                  child: Text(
                    room.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 5,
                child: SizedBox(
                  width: 150,
                  child: Text(
                    "Quarto",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
