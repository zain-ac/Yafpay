class UserRegisterResponse {
  bool? error;
  LoginResult? result;
  String? message;
  int? statusCode;

  UserRegisterResponse({
    this.error,
    this.result,
    this.message,
    this.statusCode,
  });

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) => UserRegisterResponse(
    error: json["error"],
    result: json["result"] == null ? null : LoginResult.fromJson(json["result"]),
    message: json["message"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "result": result?.toJson(),
    "message": message,
    "statusCode": statusCode,
  };
}

class LoginResult {
  String? token;
  User? user;

  LoginResult({
    this.token,
    this.user,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) => LoginResult(
    token: json["token"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user?.toJson(),
  };
}

class User {
  int? id;
  Language? language;
  Currency? currency;
  Country? country;
  String? password;
  dynamic lastLogin;
  bool? isSuperuser;
  String? userFirstName;
  String? userLastName;
  bool? isStaff;
  bool? isActive;
  DateTime? dateJoined;
  String? firstName;
  String? lastName;
  String? yafpayTag;
  String? gender;
  String? email;
  String? phoneNumber;
  String? pin;
  String? kinFirstName;
  String? kinLastName;
  String? kinEmail;
  String? kinAddress;
  String? kinMobileNumber;
  String? relationshipWithKin;
  String? referralCode;
  String? status;
  bool? isPhoneVerified;
  bool? isEmailVerified;
  bool? is2Fa;
  DateTime? updateDate;
  List<dynamic>? groups;
  List<dynamic>? userPermissions;

  User({
    this.id,
    this.language,
    this.currency,
    this.country,
    this.password,
    this.lastLogin,
    this.isSuperuser,
    this.userFirstName,
    this.userLastName,
    this.isStaff,
    this.isActive,
    this.dateJoined,
    this.firstName,
    this.lastName,
    this.yafpayTag,
    this.gender,
    this.email,
    this.phoneNumber,
    this.pin,
    this.kinFirstName,
    this.kinLastName,
    this.kinEmail,
    this.kinAddress,
    this.kinMobileNumber,
    this.relationshipWithKin,
    this.referralCode,
    this.status,
    this.isPhoneVerified,
    this.isEmailVerified,
    this.is2Fa,
    this.updateDate,
    this.groups,
    this.userPermissions,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    language: json["language"] == null ? null : Language.fromJson(json["language"]),
    currency: json["currency"] == null ? null : Currency.fromJson(json["currency"]),
    country: json["country"] == null ? null : Country.fromJson(json["country"]),
    password: json["password"],
    lastLogin: json["last_login"],
    isSuperuser: json["is_superuser"],
    userFirstName: json["first_name"],
    userLastName: json["last_name"],
    isStaff: json["is_staff"],
    isActive: json["is_active"],
    dateJoined: json["date_joined"] == null ? null : DateTime.parse(json["date_joined"]),
    firstName: json["firstName"],
    lastName: json["lastName"],
    yafpayTag: json["yafpayTag"],
    gender: json["gender"],
    email: json["email"],
    phoneNumber: json["phoneNumber"],
    pin: json["pin"],
    kinFirstName: json["kinFirstName"],
    kinLastName: json["kinLastName"],
    kinEmail: json["kinEmail"],
    kinAddress: json["kinAddress"],
    kinMobileNumber: json["kinMobileNumber"],
    relationshipWithKin: json["relationshipWithKin"],
    referralCode: json["referralCode"],
    status: json["status"],
    isPhoneVerified: json["isPhoneVerified"],
    isEmailVerified: json["isEmailVerified"],
    is2Fa: json["is2FA"],
    updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
    groups: json["groups"] == null ? [] : List<dynamic>.from(json["groups"]!.map((x) => x)),
    userPermissions: json["user_permissions"] == null ? [] : List<dynamic>.from(json["user_permissions"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "language": language?.toJson(),
    "currency": currency?.toJson(),
    "country": country?.toJson(),
    "password": password,
    "last_login": lastLogin,
    "is_superuser": isSuperuser,
    "first_name": userFirstName,
    "last_name": userLastName,
    "is_staff": isStaff,
    "is_active": isActive,
    "date_joined": dateJoined?.toIso8601String(),
    "firstName": firstName,
    "lastName": lastName,
    "yafpayTag": yafpayTag,
    "gender": gender,
    "email": email,
    "phoneNumber": phoneNumber,
    "pin": pin,
    "kinFirstName": kinFirstName,
    "kinLastName": kinLastName,
    "kinEmail": kinEmail,
    "kinAddress": kinAddress,
    "kinMobileNumber": kinMobileNumber,
    "relationshipWithKin": relationshipWithKin,
    "referralCode": referralCode,
    "status": status,
    "isPhoneVerified": isPhoneVerified,
    "isEmailVerified": isEmailVerified,
    "is2FA": is2Fa,
    "updateDate": updateDate?.toIso8601String(),
    "groups": groups == null ? [] : List<dynamic>.from(groups!.map((x) => x)),
    "user_permissions": userPermissions == null ? [] : List<dynamic>.from(userPermissions!.map((x) => x)),
  };
}

class Country {
  int? id;
  String? name;
  String? isoCode;
  String? isoCode3;
  String? phoneCode;
  dynamic status;

  Country({
    this.id,
    this.name,
    this.isoCode,
    this.isoCode3,
    this.phoneCode,
    this.status,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
    isoCode: json["isoCode"],
    isoCode3: json["isoCode3"],
    phoneCode: json["phoneCode"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "isoCode": isoCode,
    "isoCode3": isoCode3,
    "phoneCode": phoneCode,
    "status": status,
  };
}

class Currency {
  int? id;
  String? currencyName;
  String? currencyCode;
  String? currecySymbol;
  dynamic status;

  Currency({
    this.id,
    this.currencyName,
    this.currencyCode,
    this.currecySymbol,
    this.status,
  });

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    id: json["id"],
    currencyName: json["currencyName"],
    currencyCode: json["currencyCode"],
    currecySymbol: json["currecySymbol"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "currencyName": currencyName,
    "currencyCode": currencyCode,
    "currecySymbol": currecySymbol,
    "status": status,
  };
}

class Language {
  int? id;
  String? shortName;
  String? languageName;
  dynamic status;

  Language({
    this.id,
    this.shortName,
    this.languageName,
    this.status,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    id: json["id"],
    shortName: json["shortName"],
    languageName: json["languageName"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shortName": shortName,
    "languageName": languageName,
    "status": status,
  };
}




//
class ShipmentDetailsResponse {
  bool? error;
  dynamic result;
  String? message;
  int? statusCode;

  ShipmentDetailsResponse({
    this.error,
    this.result,
    this.message,
    this.statusCode,
  });

  factory ShipmentDetailsResponse.fromJson(Map<String, dynamic> json) => ShipmentDetailsResponse(
    error: json["error"],
    result: json["result"],
    message: json["message"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "result": result,
    "message": message,
    "statusCode": statusCode,
  };
}
