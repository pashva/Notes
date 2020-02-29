class User{
  String _username;
  String _description;
  int _id;

  User(this._username,this._description);

  User.map(dynamic obj){
    this._username=obj['username'];
    this._id=obj['id'];
    this._description=obj['description'];
  }

  String get username=>_username;
  String get description=>_description;
  int get id=>_id;

  Map<String,dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map["id"] = _id;
    }
    map["username"] = _username;
    map["description"]=_description;

    return map;
  }

  User.fromMap(Map<String,dynamic> map){
    this._username=map["username"];
    this._id=map["id"];
    this._description=map["description"];

  }

}