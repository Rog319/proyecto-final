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
          width: _folded ? 56 : 200,
          height: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
            boxShadow: kElevationToShadow[6],
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: !_folded
                      ? TextField(
                          decoration: InputDecoration(
                              hintText: 'Buscar',
                              hintStyle: TextStyle(color: Colors.blue[300]),
                              border: InputBorder.none),
                          controller: controller,
                        )
                      : null,
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
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Icon(
                        _folded ? Icons.search : Icons.close,
                        color: Colors.blue[900],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _folded = !_folded;
                      });
                      controller.clear();
                      spotifyServices.clearCancionesRegresados();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        ElevatedButton(
          child: const Text('Buscar'),
          onPressed: () {
            if (controller.text != '') {
              spotifyServices.changeTrack(controller.text);
              spotifyServices.getService();
            }
          },
        ),
      ],
    );
  }
}
