import 'package:weather_tutorial/data/API/api_client.dart';

String getIconUrl(String id) {
  return "${ApiClient.iconUrl}$id@2x.png";
}
