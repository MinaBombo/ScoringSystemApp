import 'package:flutter/material.dart';
import 'package:scoring_system/model/Team.dart';

class _TeamListItemKey implements LocalKey {}

class TeamListItem extends StatefulWidget {
  final Team _team;
  final int _index;
  final Function _onDismiss;

  TeamListItem(this._team, this._index, this._onDismiss)
      : super(key: new _TeamListItemKey());

  @override
  _TeamListItemState createState() => new _TeamListItemState(_index);
}

class _TeamListItemState extends State<TeamListItem> {
  static final double _padding = 10.0;
  static final double _fontSize = 30.0;
  static final double _borderWidth = 1.0;

  static final Color _colorGold = new Color(0xFFE5C100);
  static final Color _colorSilver = new Color(0xFFACACAC);
  static final Color _colorBronze = new Color(0xFF945A05);
  static final Color _colorVerySoftBlue = new Color(0xFFb6E1F6);

  static final Color _nameBorderColor = Colors.black;
  static final Color _nameFontColor = Colors.black;
  static final Color _scoreBackgroundColor = Colors.white;
  static final Color _scoreBorderColor = Colors.black;
  static final Color _scoreFontColor = Colors.black;

  Color _nameBackgroundColor;
  String _medalPath;

  _TeamListItemState(int index) : super() {
    switch (index) {
      case 0:
        _nameBackgroundColor = _colorGold;
        _medalPath = "assets/icons/gold_medal.png";
        break;
      case 1:
        _nameBackgroundColor = _colorSilver;
        _medalPath = "assets/icons/silver_medal.png";
        break;
      case 2:
        _nameBackgroundColor = _colorBronze;
        _medalPath = "assets/icons/bronze_medal.png";
        break;
      default:
        _nameBackgroundColor = _colorVerySoftBlue;
        _medalPath = "assets/icons/white_medal.png";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Dismissible(
      onDismissed: (direction) => widget._onDismiss(widget._index),
      key: widget.key,
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Container(
              decoration: new BoxDecoration(
                color: _nameBackgroundColor,
                border: new Border.all(
                  color: _nameBorderColor,
                  width: _borderWidth,
                ),
              ),
              child: new Padding(
                padding: new EdgeInsets.all(_padding),
                child: new Row(
                  children: <Widget>[
                    //TODO: Maybe make space between image and name
                    new Image.asset(_medalPath, repeat: ImageRepeat.noRepeat),
                    new Text(
                      widget._team.name,
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                        fontSize: _fontSize,
                        fontWeight: FontWeight.bold,
                        color: _nameFontColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          new Expanded(
            child: new Container(
              decoration: new BoxDecoration(
                color: _scoreBackgroundColor,
                border: new Border.all(
                  color: _scoreBorderColor,
                  width: _borderWidth,
                ),
              ),
              child: new Padding(
                padding: new EdgeInsets.all(_padding),
                child: new Text(
                  widget._team.score.toString(),
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                    fontSize: _fontSize,
                    fontWeight: FontWeight.bold,
                    color: _scoreFontColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
