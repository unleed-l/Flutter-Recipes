import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import '../models/filters.dart';

class SettingsScreen extends StatefulWidget {
  final Filters filters;
  final Function(Filters) onFiltersChanged;

  const SettingsScreen(
      {Key? key, required this.filters, required this.onFiltersChanged})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Filters? filters;

  @override
  void initState() {
    super.initState();
    filters = widget.filters;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Card(
      elevation: 5,
      child: SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          onChanged(value);
          widget.onFiltersChanged(filters!);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Filtros',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Gluten',
                  'Só exibe refeições sem glúten',
                  filters!.isGlutenFree,
                  (value) => setState(() => filters!.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem lactose',
                  filters!.isLactoseFree,
                  (value) => setState(() => filters!.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegano',
                  'Só exibe refeições vaganas',
                  filters!.isVegan,
                  (value) => setState(() => filters!.isVegan = value),
                ),
                _createSwitch(
                  'Sem Vegetariano',
                  'Só exibe refeições vegetarianas',
                  filters!.isVegetarian,
                  (value) => setState(() => filters!.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
