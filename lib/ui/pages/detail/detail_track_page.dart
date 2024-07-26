// part of '../pages.dart';

// class DetailTrackPage extends StatefulWidget {
//   const DetailTrackPage({super.key});

//   @override
//   State<DetailTrackPage> createState() => _DetailTrackPageState();
// }

// class _DetailTrackPageState extends State<DetailTrackPage> {
//   final Completer<GoogleMapController> _controller = Completer();

//   static const LatLng sourceLocation =  LatLng(-7.3332948136167255, 112.77130304742427);
//   static const LatLng destination =  LatLng(-7.221698552256317, 112.73157369655956);

//   List<LatLng> polylineCoordinates = [];
//   LocationData? currentLocation;

//   BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
//   BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

//   void getCurrentLocation () async {
//     Location location = Location();

//     location.getLocation().then(
//       (location) {
//         currentLocation=  location;
//       },
//     );

//     GoogleMapController googleMapController = await _controller.future;

//     location.onLocationChanged.listen(
//       (newLoc) {
//         currentLocation = newLoc;

//         googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//           zoom: 15.5,
//           target: LatLng(
//             newLoc.latitude!,
//             newLoc.longitude!
//           ),
//           )));

//         setState(() {});
//       }
//     );
//   }

//   void getPolyPoints() async{
//     PolylinePoints polylinePoints = PolylinePoints();

//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       google_api_key, 
//       PointLatLng(sourceLocation.latitude, sourceLocation.longitude), 
//       PointLatLng(destination.latitude, destination.longitude));

//     if (result.points.isNotEmpty) {
//       result.points.forEach(
//         (PointLatLng point) => polylineCoordinates.add(
//           LatLng(point.latitude, point.longitude)
//         ),
//       );
//       setState(() {});
//     }
//   }

//   void setCustomMarkerIcon(){
//     BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/source.png")
//     .then(
//       (icon) {
//         sourceIcon = icon;
//       }
//     );
//     BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/destination.png")
//     .then(
//       (icon) {
//         destinationIcon = icon;
//       }
//     );
//     BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/loc.png")
//     .then(
//       (icon) {
//         currentLocationIcon = icon;
//       }
//     );
//   }

//   @override
//   void initState(){
//     getCurrentLocation();
//     setCustomMarkerIcon();
//     getPolyPoints();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar : AppBar(
//         title : const Text('Detail Tracking')
//       ),
//       body : currentLocation == null
//       ? const Center(child: Text("Loading"))
//       : GoogleMap(
//         initialCameraPosition: const CameraPosition(
//           target: sourceLocation ,
//           zoom:13.5),
//         polylines: {
//           Polyline(
//             polylineId: const PolylineId('route'),
//             points: polylineCoordinates,
//             color: primaryColor,
//             width:6,
//           )
//         },
//         markers:{
//           Marker(
//             markerId: const MarkerId('currentLocation'),
//             icon : currentLocationIcon,
//             position: LatLng(
//               currentLocation!.latitude!, currentLocation!.longitude!)
//           ),
//           Marker(
//             markerId: MarkerId('source'),
//             icon : sourceIcon,
//             position: sourceLocation
//           ),
//           Marker(
//             markerId: MarkerId('destination'),
//             icon : destinationIcon,
//             position: destination
//           )
//         },
//         onMapCreated: (mapController){
//           _controller.complete(mapController);
//         },
//       )
//     );
//   }
// }
