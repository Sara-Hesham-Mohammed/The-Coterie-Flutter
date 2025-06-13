import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocationPicker extends StatefulWidget {
  final ValueChanged<LocationData> onLocationSelected;
  final String? initialCountry;
  final String? initialCity;

  const LocationPicker({
    Key? key,
    required this.onLocationSelected,
    this.initialCountry,
    this.initialCity,
  }) : super(key: key);

  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  final _formKey = GlobalKey<FormState>();
  final _cityController = TextEditingController();

  String? _selectedCountry;
  String? _selectedCity;

  // Sample data - in a real app, you would fetch this from an API or database
  final List<String> _countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'Germany',
    'France'
  ];

  // Modified to be cities by country instead of by state
  final Map<String, List<String>> _citiesByCountry = {
    'United States': [
      'New York',
      'Los Angeles',
      'Chicago',
      'Houston',
      'Phoenix'
    ],
    'Canada': [
      'Toronto',
      'Montreal',
      'Vancouver',
      'Calgary',
      'Ottawa'
    ],
    'United Kingdom': ['London', 'Manchester', 'Birmingham', 'Liverpool', 'Glasgow'],
    'Australia': ['Sydney', 'Melbourne', 'Brisbane', 'Perth', 'Adelaide'],
    'Germany': ['Berlin', 'Munich', 'Hamburg', 'Frankfurt', 'Cologne'],
    'France': ['Paris', 'Marseille', 'Lyon', 'Toulouse', 'Nice'],
  };

  @override
  void initState() {
    super.initState();
    // Initialize with provided values
    _selectedCountry = widget.initialCountry;
    _selectedCity = widget.initialCity;
    _cityController.text = widget.initialCity ?? '';
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  void _submitLocation() {
    if (_formKey.currentState!.validate()) {
      final location = LocationData(
        country: _selectedCountry!,
        city: _selectedCity ?? _cityController.text,
      );
      widget.onLocationSelected(location);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Country Dropdown
          DropdownButtonFormField<String>(
            value: _selectedCountry,
            decoration: InputDecoration(
              labelText: 'Country',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.public),
            ),
            items: _countries.map((country) {
              return DropdownMenuItem(
                value: country,
                child: Text(country),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCountry = value;
                _selectedCity = null;
                _cityController.clear();
              });
            },
            validator: (value) =>
            value == null ? 'Please select a country' : null,
          ),
          SizedBox(height: 16),

          // City Dropdown
            DropdownButtonFormField<String>(
              value: _selectedCity,
              decoration: InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
              ),
              items: _citiesByCountry[_selectedCountry]!.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCity = value;
                });
              },
              validator: (value) => value == null ? 'Please select a city' : null,
            ),
          SizedBox(height: 16),

          // Submit Button
          ElevatedButton(
            onPressed: _submitLocation,
            child: Text('Confirm Location'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class LocationData {
  final String country;
  final String city;

  LocationData({
    required this.country,
    required this.city,
  });

  @override
  String toString() {
    return '$city, $country';
  }
}