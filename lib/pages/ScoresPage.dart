import 'package:flutter/material.dart';
import 'package:scoring_system/model/Team.dart';
import 'package:scoring_system/widgets/TeamListItem.dart';

class ScoresPage extends StatefulWidget {
  ScoresPage({Key key}) : super(key: key);
  @override
  ScoresPageState createState() => new ScoresPageState();
}

class ScoresPageState extends State<ScoresPage> {
  // TODO: get from db
  List<Team> _teams =
      new List<Team>.generate(20, (i) => new Team("Team ${i + 1}", 0));

  List<Team> get teams => _teams;
  void removeTeam(int index) => setState(() => _teams.removeAt(index));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Event Name"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.settings),
            onPressed: null,
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new ListView.builder(
              itemCount: _teams.length,
              itemBuilder: (context, index) {
                return new TeamListItem(_teams[index], index, removeTeam);
              },
            ),
          ),
        ],
      ),
    );
  }
}
