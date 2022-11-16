import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
//import 'package:mapir_raster/mapir_raster.dart';
import 'package:yarsi/config/palette.dart';
import 'package:yarsi/config/size_config.dart';

class CurrentLocation extends StatelessWidget {

  final double lat;
  final double long;

  const CurrentLocation({Key? key, required this.lat, required this.long}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Palette.primaryDarkColor,width: 2.0, style: BorderStyle.solid)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          // child: MapirMap(
          //     apiKey: 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImMxODQ1ZjY4YzlmMTQ5Y2FhM2Q0NjFhNTliZmY5OGMxYWIxMTdhMmMyOWZjYmIzZDczNGJhN2M2NmE4MjQ5Y2I2NDI1MGY5OGIzMTM3YmRkIn0.eyJhdWQiOiIxODcwMiIsImp0aSI6ImMxODQ1ZjY4YzlmMTQ5Y2FhM2Q0NjFhNTliZmY5OGMxYWIxMTdhMmMyOWZjYmIzZDczNGJhN2M2NmE4MjQ5Y2I2NDI1MGY5OGIzMTM3YmRkIiwiaWF0IjoxNjU3NzQxNzAwLCJuYmYiOjE2NTc3NDE3MDAsImV4cCI6MTY2MDMzMzcwMCwic3ViIjoiIiwic2NvcGVzIjpbImJhc2ljIl19.lBN11-tqv0ZRX4hW_8TmYf2WG4WK9yZEzSQ9SUzjakXYnhX97Qb-t99orO5oDxN5P5RGplfGmiYrGrBirjpetf-O1tpaEExhhJePBTeNHzI5aghzm-WmMna7mCectELSPlXbhqJgcPp2BsjZV0LMUDGefSqjbseUYF4GskEG8ew_lZH4nSBjILH1TCnq8qq87Ba2nBxO67FlI06JLjjzzxxovccJaOLA9JZrBxvTBv-jh1WZ_67i6fc7dNQHgp29U7Q3h4L4MhYuiAiwv4BZ9Al0Iyb62uV2xiOP6FmOk65MbhyQZJW4LAj2V8zu1XxJF8oa-EVsCRz3kbSk70yVrg',
          //     options: MapOptions(
          //         center: LatLng(lat, long),
          //         zoom: 16.0,
          //         minZoom: 8.0,
          //         maxZoom: 16.0,
          //         allowPanning: false,
          //         onTap: (e,t) => {
          //         }
          //     ),
          //     layers: [
          //       MarkerLayerOptions(
          //         markers: [
          //           Marker(
          //             rotate: true,
          //             width: 120.0,
          //             height: 120.0,
          //             point: LatLng( lat, long),
          //             builder: (ctx) => new Icon(Icons.pin_drop_outlined, size: 20.0,
          //                 color: Colors.red),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
        ),
      ),
    );
  }
}
