import 'package:flutter/material.dart';
import 'package:flutter_appworks/directions_page.dart';
import 'package:flutter_appworks/location_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({super.key});

  @override
  State<SearchLocationPage> createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  late GoogleMapController _mapController;
  final TextEditingController _searchController = TextEditingController();
  final Set<Marker> _markers = <Marker>{};
  final LatLng _center = const LatLng(25.0384799, 121.5323702);

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(Marker(markerId: const MarkerId('marker'), position: point));
    });
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _mapController;

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 15,
        ),
      ),
    );

    _setMarker(LatLng(lat, lng));
  }

  @override
  void initState() {
    super.initState();

    _setMarker(_center);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const DirectionsPage();
                      },
                    ),
                  );
                },
                icon: const Icon(Icons.explore_outlined))
          ],
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search by City',
                    contentPadding: EdgeInsets.all(8),
                  ),
                  onFieldSubmitted: (value) async {
                    var place = await LocationService().getPlace(value);

                    _goToPlace(place);
                  },
                )),
                IconButton(
                  onPressed: () async {
                    var place = await LocationService()
                        .getPlace(_searchController.text);

                    // print(place);
                    _goToPlace(place);
                  },
                  icon: const Icon(Icons.search),
                )
              ],
            ),
            Expanded(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 12.0,
                ),
                markers: _markers,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
