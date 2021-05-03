import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:poc_gps/util/location_util.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationUtil.generateLocationPreviewImage(
      latitude: locData.latitude,
      longitude: locData.longitude
    );
    print(locData.latitude);
    print(locData.longitude);

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey
            ),
          ),
          child: _previewImageUrl == null ? Text('Localização não informada') : 
          Image.network(_previewImageUrl, fit: BoxFit.cover, width: double.infinity,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // ignore: deprecated_member_use
            FlatButton.icon(
              onPressed: _getCurrentUserLocation, 
              icon: Icon(Icons.location_on), 
              label: Text('Localização Atual'),
              textColor: Theme.of(context).primaryColor,
            ),
            // ignore: deprecated_member_use
            FlatButton.icon(
              onPressed: () {}, 
              icon: Icon(Icons.map), 
              label: Text('Selecione no Mapa'),
              textColor: Theme.of(context).primaryColor,
            ),
          ],
        )
      ],
    );
  }
}