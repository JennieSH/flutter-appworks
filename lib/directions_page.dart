import 'package:flutter/material.dart';
import 'package:flutter_appworks/location_service.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionsPage extends StatefulWidget {
  const DirectionsPage({super.key});

  @override
  State<DirectionsPage> createState() => _DirectionsPageState();
}

class _DirectionsPageState extends State<DirectionsPage> {
  late GoogleMapController _mapController;
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  final Set<Marker> _markers = <Marker>{};
  final Set<Polyline> _polylines = <Polyline>{};
  final LatLng _center = const LatLng(45.521563, -122.677433);

  int _polylineCounter = 1;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(Marker(markerId: const MarkerId('marker'), position: point));
    });
  }

  void _setPolyline(List<PointLatLng> points) {
    final String polylineIdValue = 'polyline_$_polylineCounter';
    _polylineCounter++;

    _polylines.add(
      Polyline(
        polylineId: PolylineId(polylineIdValue),
        width: 2,
        color: Colors.blue,
        points: points
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList(),
      ),
    );
  }

  Future<void> _goToPlace(
      double lat,
      double lng,
      Map<String, dynamic> boundsNortheast,
      Map<String, dynamic> boundsSouthwest) async {
    final GoogleMapController controller = await _mapController;

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 12,
        ),
      ),
    );

    controller.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          northeast: LatLng(boundsNortheast['lat'], boundsNortheast['lng']),
          southwest: LatLng(boundsSouthwest['lat'], boundsSouthwest['lng']),
        ),
        25,
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
          ),
          body: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _originController,
                          decoration: const InputDecoration(
                            hintText: 'Origin',
                            contentPadding: EdgeInsets.all(8),
                          ),
                        ),
                        TextFormField(
                          controller: _destinationController,
                          decoration: const InputDecoration(
                            hintText: 'Destination',
                            contentPadding: EdgeInsets.all(8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      var directions = await LocationService().getDirections(
                        _originController.text,
                        _destinationController.text,
                      );

                      _goToPlace(
                        directions['end_location']['lat'],
                        directions['end_location']['lng'],
                        directions['bounds_northeast'],
                        directions['bounds_southwest'],
                      );

                      _setPolyline(directions['polyline_decoded']);
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              Expanded(
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                  markers: _markers,
                  polylines: _polylines,
                ),
              ),
            ],
          )),
    );
  }
}
