class User {
  String _kind = '';
  String _localId = '';
  String _email = '';
  String _displayName = '';
  String _idToken = '';
  bool _registered = true;
  String? _profilePicture = '';

  User(
      {required String kind,
        required String localId,
        required String email,
        required String displayName,
        required String idToken,
        required bool registered,
        required String? profilePicture}) {
    _kind = kind;
    _localId = localId;
    _email = email;
    _displayName = displayName;
    _idToken = idToken;
    _registered = registered;
    _profilePicture = profilePicture;
  }

  String get kind => _kind;
  set kind(String kind) => _kind = kind;
  String get localId => _localId;
  set localId(String localId) => _localId = localId;
  String get email => _email;
  set email(String email) => _email = email;
  String get displayName => _displayName;
  set displayName(String displayName) => _displayName = displayName;
  String get idToken => _idToken;
  set idToken(String idToken) => _idToken = idToken;
  bool get registered => _registered;
  set registered(bool registered) => _registered = registered;
  String get profilePicture => _profilePicture == null ? '' : _profilePicture!;
  set profilePicture(String profilePicture) => _profilePicture = profilePicture;

  User.fromJson(Map<String, dynamic> json) {
    try {
      // _kind = json['kind'];
      _localId = json['localId'];
      _email = json['email'];
      _displayName = json['displayName'];
      _idToken = json['idToken'];
      _registered = json['registered'];
      _profilePicture = json['profilePicture'];
    } catch (e, stackTrace){
      print(stackTrace);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['kind'] = _kind;
    data['localId'] = _localId;
    data['email'] = _email;
    data['displayName'] = _displayName;
    data['idToken'] = _idToken;
    data['registered'] = _registered;
    data['profilePicture'] = _profilePicture;
    return data;
  }

  @override
  String toString() {
    return 'User{\n_localId: $_localId, \n_email: $_email, '
        '\n_displayName: $_displayName, \n_idToken: $_idToken, '
        '\n_registered: $_registered, \n_profilePicture: $_profilePicture}';
  }
}