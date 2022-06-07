import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/spotify_services.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _folded = true;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final spotifyServices = Provider.of<SpotifyServices>(context);
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(microseconds: 400),
          width: 200,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            boxShadow: kElevationToShadow[6],
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: TextField(
                    decoration: const InputDecoration(
                        hintText: 'Buscar',
                        hintStyle: TextStyle(color: Colors.deepPurple),
                        border: InputBorder.none),
                    controller: controller,
                  ),
                ),
              ),
              AnimatedContainer(
                  duration: const Duration(microseconds: 400),
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(_folded ? 32 : 0),
                          topRight: const Radius.circular(32),
                          bottomLeft: Radius.circular(_folded ? 32 : 0),
                          bottomRight: const Radius.circular(32)),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.close,
                          color: Colors.deepPurple,
                        ),
                      ),
                      onTap: () {
                        controller.clear();
                        spotifyServices.clearCancionesRegresados();
                      },
                    ),
                  ))
            ],
          ),
        ),
        SizedBox(
          child: ElevatedButton(
            child: const Text('Buscar'),
            onPressed: () {
              if (controller.text != '') {
                spotifyServices.changeTrack(controller.text);
                spotifyServices.getService();
              }
            },
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ))),
          ),
        ),
      ],
    );
  }
}
