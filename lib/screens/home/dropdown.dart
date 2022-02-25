import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_firebase/services/forecastBloC.dart';
import 'package:todo_firebase/shared/constants.dart';

class CityDropDown extends StatefulWidget {
  const CityDropDown({Key? key}) : super(key: key);

  @override
  _CityDropDownState createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ForecastBloC>(context, listen: false).fetch("London");
    print("Naber");
    return DropdownButtonFormField(
      decoration: textInputDecoration,
      hint: const Text("Choose City"),
      items: cities.map((city) {
        return DropdownMenuItem(value: city, child: Text(city));
      }).toList(),
      onChanged: (val) {
        Provider.of<ForecastBloC>(context, listen: false).fetch(val.toString());
      },
    );
  }
}
