import 'package:flutter/material.dart';

import '../location_picker.dart';

class LocationPickerButton extends StatelessWidget {
  final String? selectedLocation;
  final ValueChanged<LocationData> onLocationSelected;

  const LocationPickerButton({
    Key? key,
    this.selectedLocation,
    required this.onLocationSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){

    }, icon: Icon(Icons.location_on),);
    // return OutlinedButton.icon(
    //   icon: Icon(Icons.location_on),
    //   onPressed: () => _showLocationPicker(context),
    //   style: OutlinedButton.styleFrom(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(8),
    //     ),
    //   ), label: Text(''),
    // );
  }

  void _showLocationPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Location'),
        content: SizedBox(
          width: double.maxFinite,
          height: 200,
          child: LocationPicker(
            onLocationSelected: (location) {
              Navigator.pop(context); // Close the dialog
              onLocationSelected(location); // Return the selected location
            },
            initialCountry: selectedLocation?.split(', ').last,
            initialCity: selectedLocation?.split(', ').first,
          ),
        ),
      ),
    );
  }
}