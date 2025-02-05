import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls + Tiles"),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bike, boat, plane }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloperMode = false;
  Transportation selectedTransportation = Transportation.car;
  bool hasValidPassport = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text("Developer mode"),
          subtitle: const Text("Enable developer mode"),
          value: isDeveloperMode,
          onChanged: (value) => setState(() => isDeveloperMode = !isDeveloperMode),
        ),
        const SizedBox(height: 20),
        ExpansionTile(
          title: const Text("Transportation"),
          subtitle: Text(selectedTransportation.toString()),
          initiallyExpanded: true,
          children: [
            RadioListTile(
              title: const Text("Car"),
              subtitle: const Text("A four-wheeled vehicle"),
              value: Transportation.car,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() => selectedTransportation = Transportation.car),
            ),
            RadioListTile(
              title: const Text("Bike"),
              subtitle: const Text("A two-wheeled vehicle"),
              value: Transportation.bike,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() => selectedTransportation = Transportation.bike),
            ),
            RadioListTile(
              title: const Text("Boat"),
              subtitle: const Text("A watercraft"),
              value: Transportation.boat,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() => selectedTransportation = Transportation.boat),
            ),
            RadioListTile(
              title: const Text("Plane"),
              subtitle: const Text("An aircraft"),
              value: Transportation.plane,
              groupValue: selectedTransportation,
              onChanged: (value) => setState(() => selectedTransportation = Transportation.plane),
            )
          ],
        ),
        const SizedBox(height: 20),
        CheckboxListTile(
          title: const Text("Valid passport"),
          subtitle: Text("Has a valid passport: $hasValidPassport"),
          value: hasValidPassport,
          onChanged: (value) => setState(() => hasValidPassport = !hasValidPassport),
        ),
      ],
    );
  }
}
