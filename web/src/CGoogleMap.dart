import 'dart:html';
import 'dart:async';
import 'package:js/js.dart' as js;
import 'package:google_maps/google_maps.dart';
import 'st.dart';

class CGoogleMap
{
  var _map;
  var _mapOptions;

  CGoogleMap()
  {
    /*st.DB().get('gmap','current_center_lat',0);
    st.DB().get('gmap','current_center_lon',0);
    st.DB().get('gmap','current_zoom',5);*/
    _mapOptions = new MapOptions()
    ..zoom = st.Options().get('gmap', 'current_zoom', 8)
    ..center = new LatLng(st.Options().get('gmap', 'current_center_lat', 0), st.Options().get('gmap', 'current_center_lng', 0))
    ..mapTypeId = MapTypeId.ROADMAP
    ;
  }

  void initialize()
  {
    _map = new GMap(querySelector("#map_canvas"), _mapOptions);
    js.retain(_map);
    _map.onCenterChanged.listen((_)
    {
      new Timer(const Duration(seconds: 1), ()
      {
        var center = _map.center;
        st.Options().set('gmap', 'current_center_lat', center.lat);
        st.Options().set('gmap', 'current_center_lng', center.lng);
        st.Options().write();
      });
    });
    _map.onZoomChanged.listen((_)
    {
      new Timer(const Duration(seconds: 1), ()
      {
        st.Options().set('gmap', 'current_zoom', _map.zoom);
        st.Options().write();
      });
    });

  }
}