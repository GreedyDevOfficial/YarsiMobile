
import 'package:latlong2/latlong.dart' as coordinates;

class LocationResult {
  /// The latitude of the result.
  final double latitude;

  /// The longitude of the result.
  final double longitude;

  /// Construct the result with a latitude and longitude.
  LocationResult(this.latitude, this.longitude) ;

  /// returns the SimpleLocationResult location as a LatLng object
  getLatLng()  => coordinates.LatLng(latitude, longitude);
}