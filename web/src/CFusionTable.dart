import "package:google_fusiontables_v1_api/fusiontables_v1_api_browser.dart";
import "package:google_oauth2_client/google_oauth2_browser.dart";

class CFusionTable
{
  static const _tableName = '1bSPQ16GyMxgRuleMBdn1aFH4Xfuv0E3HRv__ADs';
  static const _apiKey = "AIzaSyDEjhHBDyMT--hJfnSpGKo2Phe_0svdeag";
  static const _clientID = "485095129212-t0t40ij5935464jcq8cro9ljerlipbuq.apps.googleusercontent.com";
  static const _clientSecret = "pRtHqNNsajfWdjXCxkTS2rSR";

  GoogleOAuth2 _gauth;

  CFusionTable()
  {
    _gauth = new GoogleOAuth2(_clientID, ["https://www.google.com/fusiontables/"]);
    print(_gauth);
    var fusiontables = new Fusiontables(_gauth);
    fusiontables.query.sql('select ID, Name, Latitude, Longitude, Country, Territory, City, Photo, ROWID from '+_tableName,
        hdrs: false)
      .then(_loadData);

  }

  void _loadData(data)
  {
    print (data.toString());
  }
}