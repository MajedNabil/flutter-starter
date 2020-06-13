class Member {
  String _name;
  String _age;

  Member(this._name, this._age);

  set age(String value) {
    _age = value;
  }

  set name(String value) {
    _name = value;
  }

  String get age => _age;

  String get name => _name;
}


