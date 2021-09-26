import 'package:flutter/material.dart';
import 'package:gate_aspirants/main_drawer.dart';

import '../constants.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String , bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _computer = false;
  bool _iT = false;
  bool _chemical = false;
  bool _civil = false;
  bool _electrical = false;
  bool _electronics = false;
  bool _instrumentation = false;
  bool _mechanical = false;

  @override
  void initState() {
    _computer = widget.currentFilters['Computer'];
    _iT = widget.currentFilters['IT'];
    _chemical = widget.currentFilters['Chemical'];
    _civil = widget.currentFilters['Civil'];
    _electrical = widget.currentFilters['Electrical'];
    _electronics = widget.currentFilters['Electronics'];
    _instrumentation = widget.currentFilters['Instrumentation'];
    _mechanical = widget.currentFilters['Mechanical'];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'Computer': _computer,
                'IT': _iT,
                'Chemical': _chemical,
                'Civil': _civil,
                'Electrical': _electrical,
                'Electronics': _electronics,
                'Instrumentation': _instrumentation,
                'Mechanical': _mechanical,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(
              Icons.save,
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  activeColor: kPrimaryColor,
                  value: _computer,
                  title: Text('Gate-Computer Sci'),
                  subtitle: Text('Only include Computer Science papers.'),
                  onChanged: (newValue) {
                    setState(
                          () {
                        _computer = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  value: _iT,
                  activeColor: kPrimaryColor,
                  title: Text('Gate-IT'),
                  subtitle: Text('Only include IT papers.'),
                  onChanged: (newValue) {
                    setState(
                          () {
                        _iT = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  activeColor: kPrimaryColor,
                  value: _chemical,
                  title: Text('Gate-Chemical Engineering'),
                  subtitle: Text('Only include Chemical Engineering papers.'),
                  onChanged: (newValue) {
                    setState(
                          () {
                        _chemical = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  activeColor: kPrimaryColor,
                  value: _civil,
                  title: Text('GATE-Civil Engineering'),
                  subtitle: Text('Only include Civil Engineering papers.'),
                  onChanged: (newValue) {
                    setState(
                          () {
                        _civil = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  activeColor: kPrimaryColor,
                  value: _electrical,
                  title: Text('GATE-Electrical Engineering'),
                  subtitle: Text('Only include Electrical Engineering papers.'),
                  onChanged: (newValue) {
                    setState(
                          () {
                        _electrical = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  activeColor: kPrimaryColor,
                  value: _electronics,
                  title: Text('GATE-Electronics Engineering'),
                  subtitle:
                  Text('Only include Electronics Engineering papers.'),
                  onChanged: (newValue) {
                    setState(
                          () {
                        _electronics = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  activeColor: kPrimaryColor,
                  value: _instrumentation,
                  title: Text('GATE-Instrumentation Engineering'),
                  subtitle:
                  Text('Only include Instrumentation Engineering papers.'),
                  onChanged: (newValue) {
                    setState(
                          () {
                        _instrumentation = newValue;
                      },
                    );
                  },
                ),
                SwitchListTile(
                  activeColor: kPrimaryColor,
                  value: _mechanical,
                  title: Text('GATE-Mechanical Engineering'),
                  subtitle: Text('Only include Mechanical Engineering papers.'),
                  onChanged: (newValue) {
                    setState(
                          () {
                        _mechanical = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
