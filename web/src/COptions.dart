import 'package:lawndart/lawndart.dart';
import 'dart:async';
import 'dart:convert';

class COptions
{
  static const _dbName = 'iplanner';
  static const _storeName = 'options';
  Map _json;
  Store _db;

  COptions()
  {
    _json = new Map();
    if (IndexedDbStore.supported)
    {
      _db = new IndexedDbStore(_dbName, _storeName);
    }
    else if (WebSqlStore.supported)
    {
      _db = new WebSqlStore(_dbName, _storeName);
    }
    else
    {
      _db = new LocalStorageStore();
    }
  }

  initialize(callback)
  {
    _db.open()
      .then((_) => _db.getByKey(_storeName))
        .then((options)
        {
            if (options != null)
            {
              _parse(options);
            }
            else
            {
              _json = new Map();
            }
            callback();
        });
  }

  void _parse(String text)
  {
    _json = JSON.decode(text);
  }

  void write()
  {
    _db.save(JSON.encode(_json), _storeName);
  }

  dynamic get(String section, String name, dynamic defValue)
  {
    if (!_json.containsKey(section))
    {
      _json[section] = new Map();
    }
    if (!_json[section].containsKey(name))
    {
      _json[section][name] = defValue;
    }
    return _json[section][name];
  }

  void set(String section, String name, dynamic value)
  {
    if (!_json.containsKey(section))
    {
      _json[section] = new Map();
    }
    _json[section][name] = value;
  }

}