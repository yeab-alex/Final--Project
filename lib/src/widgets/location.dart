import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MapPage extends StatefulWidget {
  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  MapType type;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.040567307464984, 38.76329765003023),
    zoom: 14.4746,
  );
  Set<Marker> markers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    type = MapType.hybrid;
    markers = Set.from([]);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            zoomControlsEnabled: false,
            markers: markers,
            mapType: type,
            onTap: (position) {
              Marker mk1 = Marker(
                markerId: MarkerId('1'),
                position: position,
              );
              setState(() {
                markers.add(mk1);
              });
            },
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: Color(0xffE94949),
                  onPressed: () {
                    setState(() {
                      type = type == MapType.hybrid
                          ? MapType.normal
                          : MapType.hybrid;
                    });
                  },
                  child: Icon(Icons.map),
                ),
                FloatingActionButton(
                  backgroundColor: Color(0xffE94949),
                  child: Icon(Icons.zoom_in),
                  onPressed: () async {
                    (await _controller.future)
                        .animateCamera(CameraUpdate.zoomIn());
                  },
                ),
                FloatingActionButton(
                  backgroundColor: Color(0xffE94949),
                  child: Icon(Icons.zoom_out),
                  onPressed: () async {
                    (await _controller.future)
                        .animateCamera(CameraUpdate.zoomOut());
                  },
                ),
                FloatingActionButton.extended(
                    backgroundColor: Color(0xffE94949),
                    icon: Icon(Icons.location_on),
                    label: Text("My position"),
                    onPressed: () {
                      if (markers.length < 1) print("no marker added");
                      print(markers.first.position);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
