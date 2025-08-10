class User {
  Map<String, dynamic> _data = {"name":""};

  setName(String name) {
    _data["name"] = name;
  }
  String getName() {
    if(_data["name"] == "") {
      return "Name not set";
    }
    return _data["name"];
  }
}

void main() {
  User user = User();
  print(user.getName()); // Before setting
  user.setName('Alice');
  print(user.getName());
}
