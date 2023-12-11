class CountryResponse {
  bool? error;
  List<CountryResult>? countryResult;
  String? message;
  int? statusCode;

  CountryResponse({
    this.error,
    this.countryResult,
    this.message,
    this.statusCode,
  });

  factory CountryResponse.fromJson(Map<String, dynamic> json) => CountryResponse(
    error: json["error"],
    countryResult: json["result"] == null ? [] : List<CountryResult>.from(json["result"]!.map((x) => CountryResult.fromJson(x))),
    message: json["message"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "result": countryResult == null ? [] : List<dynamic>.from(countryResult!.map((x) => x.toJson())),
    "message": message,
    "statusCode": statusCode,
  };
}

class CountryResult {
  int? id;
  String? name;
  String? isoCode;
  String? isoCode3;
  String? phoneCode;
  dynamic status;

  CountryResult({
    this.id,
    this.name,
    this.isoCode,
    this.isoCode3,
    this.phoneCode,
    this.status,
  });

  factory CountryResult.fromJson(Map<String, dynamic> json) => CountryResult(
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