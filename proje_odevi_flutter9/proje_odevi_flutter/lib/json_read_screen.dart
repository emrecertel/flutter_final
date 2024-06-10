import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class JsonDataScreen extends StatefulWidget {
  @override
  _JsonDataScreenState createState() => _JsonDataScreenState();
}

class _JsonDataScreenState extends State<JsonDataScreen> {
  List<dynamic> _cities = [];
  List<dynamic> _districts = [];
  String? _selectedCity;
  String? _selectedDistrict;

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    final jsonString = await rootBundle.rootBundle.loadString('assets/cities.json');
    final jsonResponse = json.decode(jsonString);
    setState(() {
      _cities = jsonResponse['cities'];
    });
  }

  void _onCitySelected(String? selectedCity) {
    if (selectedCity != null) {
      setState(() {
        _selectedCity = selectedCity;
        _districts = _cities.firstWhere((city) => city['name'] == selectedCity)['districts'];
        _selectedDistrict = null;
      });
    }
  }

  void _onDistrictSelected(String? selectedDistrict) {
    if (selectedDistrict != null) {
      setState(() {
        _selectedDistrict = selectedDistrict;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Veri Okuma'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                hint: Text('Şehir Seçiniz'),
                value: _selectedCity,
                onChanged: _onCitySelected,
                items: _cities.map((city) {
                  return DropdownMenuItem<String>(
                    value: city['name'],
                    child: Text(city['name']),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              DropdownButton<String>(
                hint: Text('İlçe Seçiniz'),
                value: _selectedDistrict,
                onChanged: _onDistrictSelected,
                items: _districts.map((district) {
                  return DropdownMenuItem<String>(
                    value: district,
                    child: Text(district),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
