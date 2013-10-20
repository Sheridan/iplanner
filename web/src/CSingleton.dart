import "CGoogleMap.dart";
import "COptions.dart";
import "CFusionTable.dart";

class CSingleton
{
  static final CSingleton _singleton = new CSingleton._internal();
  factory CSingleton() { return _singleton; }
  CSingleton._internal();

  CGoogleMap _gMap;
  CGoogleMap GMap()
  {
    if(_gMap == null) { _gMap = new CGoogleMap(); }
    return _gMap;
  }

  COptions _options;
  COptions Options()
  {
    if(_options == null) { _options = new COptions(); }
    return _options;
  }

  CFusionTable _fusionTable;
  CFusionTable FusionTable()
  {
    if(_fusionTable == null) { _fusionTable = new CFusionTable(); }
    return _fusionTable;
  }
}