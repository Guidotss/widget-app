import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});
  
  static const String name = 'ui_controls_screen';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls Screen'),
      ),
      body: const _UiControlsView()
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {

  bool developerMode = false;  
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  void _onSwitchChanged(bool value) {
    developerMode = value;
    setState(() {});
  }

  void _onChangeTransportation(Transportation? value) {
    selectedTransportation = value!;
    setState(() {});
  }

  void _onBreakfastChanged(bool value) {
    wantsBreakfast = value;
    setState(() {});
  }

  void _onLunchChanged(bool value) {
    wantsLunch = value;
    setState(() {});
  }

  void _onDinnerChanged(bool value) {
    wantsDinner = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: developerMode,
          title: const Text('Developer mode'),
          subtitle: const Text('Enable developer mode'),
          onChanged: (value) => _onSwitchChanged(value),
        ),

        ExpansionTile(
          title: const Text('Transportation'),
          subtitle: const Text('Select your transportation'),
          children:[
            _TransportationRadioList(selectedTransportation: selectedTransportation, onChangeTransportation: _onChangeTransportation)
          ],
        ),
        CheckboxListTile(
          value: wantsBreakfast, 
          onChanged: (value) => _onBreakfastChanged(value!) , 
          title: const Text('Breakfast')
        ),
        CheckboxListTile(
          value: wantsLunch, 
          onChanged: (value) => _onLunchChanged(value!) , 
          title: const Text('Lunch')
        ),
        CheckboxListTile(
          value: wantsDinner, 
          onChanged: (value) => _onDinnerChanged(value!) , 
          title: const Text('Dinner')
        ),
      ],
    );
  }
} 


class _TransportationRadioList extends StatelessWidget {
  const _TransportationRadioList({
    required this.selectedTransportation,
    required this.onChangeTransportation,
  });
  final Transportation selectedTransportation;
  final void Function(Transportation?) onChangeTransportation;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: const Text('Car'),
          subtitle: const Text('A car'),
          value: Transportation.car,
          groupValue: selectedTransportation,
          onChanged: (value) => onChangeTransportation(value),
        ),
        RadioListTile(
          title: const Text('Boat'),
          subtitle: const Text('A boat'),
          value: Transportation.boat,
          groupValue: selectedTransportation,
          onChanged: (value) => onChangeTransportation(value),
        ),
        RadioListTile(
          title: const Text('Submarine'),
          subtitle: const Text('A submarine'),
          value: Transportation.submarine,
          groupValue: selectedTransportation,
          onChanged: (value) => onChangeTransportation(value),
        ),
        RadioListTile(
          title: const Text('Plane'),
          subtitle: const Text('A plane'),
          value: Transportation.plane,
          groupValue: selectedTransportation,
          onChanged: (value) => onChangeTransportation(value),
        ),
      ],
    );
  }
}