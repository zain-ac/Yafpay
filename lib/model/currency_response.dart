class CurrencyResponse {
  bool? error;
  List<CurrencyResult>? currencyResult;
  String? message;
  int? statusCode;

  CurrencyResponse({
    this.error,
    this.currencyResult,
    this.message,
    this.statusCode,
  });

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) => CurrencyResponse(
    error: json["error"],
    currencyResult: json["result"] == null ? [] : List<CurrencyResult>.from(json["result"]!.map((x) => CurrencyResult.fromJson(x))),
    message: json["message"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "result": currencyResult == null ? [] : List<dynamic>.from(currencyResult!.map((x) => x.toJson())),
    "message": message,
    "statusCode": statusCode,
  };
}

class CurrencyResult {
  int? id;
  String? name;
  String? isoCode;
  String? isoCode3;
  String? phoneCode;
  dynamic status;

  CurrencyResult({
    this.id,
    this.name,
    this.isoCode,
    this.isoCode3,
    this.phoneCode,
    this.status,
  });

  factory CurrencyResult.fromJson(Map<String, dynamic> json) => CurrencyResult(
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