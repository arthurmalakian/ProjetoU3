const GOOGLE_API_KEY = 'AIzaSyDmbU7mrQZoQNZc1ZCbw3AYJm_QPg2gmQk';

class LocationUtil {
  static String generateLocationPreviewImage({
    double? latitude,
    double? longitude,
  }) {
    //https://developers.google.com/maps/documentation/maps-static/overview
    //https://pub.dev/packages/google_maps_flutter
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}