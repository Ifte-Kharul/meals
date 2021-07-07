import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routName = 'filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegeterian = false;
  var _vegan = false;
  var _lactoseFree = false;
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluteen'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegeterian = widget.currentFilters['vegeterian'];
    super.initState();
  }

  Widget _buildSwitchTile({
    String headline,
    String description,
    bool bul,
    Function updateValue,
  }) {
    return SwitchListTile(
      title: Text(headline),
      subtitle: Text(description),
      value: bul,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilter = {
                  'gluteen': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegeterian,
                };
                widget.saveFilters(selectedFilter);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Adjust Your Selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                    headline: 'Gluteen-Free',
                    description: 'Show only Gluteen free meals',
                    bul: _glutenFree,
                    updateValue: (newVal) {
                      setState(() {
                        _glutenFree = newVal;
                      });
                    }),
                _buildSwitchTile(
                    headline: 'Lactose-Free',
                    description: 'Show only Lactose free meals',
                    bul: _lactoseFree,
                    updateValue: (newVal) {
                      setState(() {
                        _lactoseFree = newVal;
                      });
                    }),
                _buildSwitchTile(
                    headline: 'Vageterian',
                    description: 'Show only Vageterian meals',
                    bul: _vegeterian,
                    updateValue: (newVal) {
                      setState(() {
                        _vegeterian = newVal;
                      });
                    }),
                _buildSwitchTile(
                    headline: 'Vagan',
                    description: 'Show only Vagan meals',
                    bul: _vegan,
                    updateValue: (newVal) {
                      setState(() {
                        _vegan = newVal;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
