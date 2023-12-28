import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trilheiro/src/repositories/place.repository.dart';
import 'package:trilheiro/src/services/place.service.dart';
import 'package:trilheiro/src/views/home/widgets/app_bar.dart';
import 'package:trilheiro/src/views/search/search.view.dart';

import 'widgets/custom_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  final CameraPosition _cameraPosition = const CameraPosition(
    target: LatLng(-23.55216, -51.46438),
    zoom: 16,
  );

  final PlaceService _placeService = PlaceService(PlaceRepository());

  Set<Marker> _mapMarkers = {};

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _loadPlaces() async {
    var places = await _placeService.getAllPlaces();

    Set<Marker> markers = {};

    for (var place in places!) {
      Marker marker = Marker(
        markerId: MarkerId(place.name ?? ''),
        position: LatLng(double.parse(place.latitude ?? '0'), double.parse(place.longitude ?? '0')),
        infoWindow: InfoWindow(
          title: place.description
        ), 
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueMagenta
        ),
        onTap: () {
          if (kDebugMode) {
            print('Shopping clicado');
          }  
        }
      ); 

      markers.add(marker);     
    }
    
    setState(() {
      _mapMarkers = markers;
    });
  }

  

  @override
  void initState() {
    super.initState();
    _loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    searchButtonClick() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchView()),
      );
    }

    registerLocal(LatLng position) {}

    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const HomeAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: searchButtonClick,
        child: const Icon(Icons.search),
      ),
      body: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: _cameraPosition,
        onMapCreated: _onMapCreated,
        markers: _mapMarkers,
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        onLongPress: registerLocal,
        onTap: registerLocal,
      ),
    );
  }
}
