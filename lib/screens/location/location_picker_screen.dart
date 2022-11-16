import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yarsi/config/constants.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/models/location_result.dart';
import 'package:yarsi/widgets/dialog/dialogs/dialogs.dart';
import 'package:yarsi/widgets/widgets.dart';
import 'package:flutter_map/flutter_map.dart' as slpMap;


class LocationPickerScreen extends StatefulWidget {
  static String routeName = "/location-picker";

  final double initialLatitude;

  final double initialLongitude;

  final double zoomLevel;

  final bool displayOnly;

  final Color markerColor;

  const LocationPickerScreen(
      {Key? key,
        this.initialLatitude = SLPConstants.DEFAULT_LATITUDE,
        this.initialLongitude = SLPConstants.DEFAULT_LONGITUDE,
        this.zoomLevel = SLPConstants.DEFAULT_ZOOM_LEVEL,
        this.displayOnly = false,
        this.markerColor = Palette.primaryDarkColor
      })
      : super(key: key);

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {

  late LocationResult _selectedLocation;

  void initState() {
    super.initState();
    _selectedLocation =
        LocationResult(widget.initialLatitude, widget.initialLongitude);
  }


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 100.0),
        child: SingleAppBar(
          onTap: () => {},
        ),
      ),
      body: Stack(
        children: [
          _osmWidget(),
          Positioned(
            bottom: 45,
            left: 5,
            right: 5,
            child: Center(
              child: Material(
                borderRadius: BorderRadius.circular(7.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(7.0),
                  onTap: () => {
                    Navigator.pop(context),
                    SuccessDialog(context, 'موقعیت شما ذخیره شد')
                  },
                  child: Container(
                    width: 95,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Palette.primaryLightColor.withOpacity(0.5)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.mapMarkerAlt, size: 18.0, color: Palette.primaryDarkColor,),
                        Text('ذخیره لوکیشن', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 10.0, color: Palette.primaryDarkColor),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _osmWidget() {
    return slpMap.FlutterMap(
        options: slpMap.MapOptions(
            center: _selectedLocation.getLatLng(),
            zoom: widget.zoomLevel,
            onTap: (tapLoc, latlang) {
              // DISPLAY_ONLY MODE: no map taps for display only mode
              if (!widget.displayOnly) {
                setState(() {
                  _selectedLocation =
                      LocationResult(latlang.latitude, latlang.longitude);
                });
              }
            },
            onPositionChanged: (mapPosition, bool) {
              Future.delayed(Duration.zero, () async {
                setState(() {
                  _selectedLocation = LocationResult(
                      mapPosition.center!.latitude, mapPosition.center!.longitude);
                });
              });

              print(mapPosition.center);
            }
        ),
        layers: [
          slpMap.TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          slpMap.MarkerLayerOptions(markers: [
            slpMap.Marker(
                width: 80.0,
                height: 80.0,
                anchorPos: slpMap.AnchorPos.align(slpMap.AnchorAlign.top),
                point: _selectedLocation.getLatLng(),
                builder: (ctx) {
                  return Icon(Icons.room, size: 80, color: widget.markerColor);
                })
          ])
        ]);
  }
}
