import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_firebase/services/forecastBloC.dart';
import 'package:todo_firebase/services/weatherBloC.dart';
import 'package:todo_firebase/shared/constants.dart';
import './../../extensions/context_extension.dart';

class CityDropDown extends StatefulWidget {
  const CityDropDown({Key? key}) : super(key: key);

  @override
  _CityDropDownState createState() => _CityDropDownState();
}

class _CityDropDownState extends State<CityDropDown> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ForecastBloC>(context, listen: false).fetch("London");
    return Container(
      width: context.highHeightValue,
      color: Colors.grey[400],
      child: DropdownButton(
        isExpanded: true,
        style: const TextStyle(color: Colors.black, fontSize: 18),
        dropdownColor: Colors.grey,
        hint: const Text("Choose City"),
        items: cities.map((city) {
          return DropdownMenuItem(
              alignment: Alignment.center,
              value: city,
              child: Text(
                city,
                overflow: TextOverflow.ellipsis,
              ));
        }).toList(),
        onChanged: (val) {
          Provider.of<ForecastBloC>(context, listen: false)
              .fetch(val.toString());
          Provider.of<WeatherBloC>(context, listen: false).fetc(val.toString());
        },
      ),
    );
  }
}
