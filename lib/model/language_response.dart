class LanguageResponse {
  bool? error;
  List<LanguageResult>? result;
  String? message;
  int? statusCode;

  LanguageResponse({
    this.error,
    this.result,
    this.message,
    this.statusCode,
  });

  factory LanguageResponse.fromJson(Map<String, dynamic> json) => LanguageResponse(
    error: json["error"],
    result: json["result"] == null ? [] : List<LanguageResult>.from(json["result"]!.map((x) => LanguageResult.fromJson(x))),
    message: json["message"],
    statusCode: json["statusCode"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "result": result == null,
    "message": message,
    "statusCode": statusCode,
  };
}

class LanguageResult {
  int? id;
  String? shortName;
  String? languageName;
  dynamic status;

  LanguageResult({
    this.id,
    this.shortName,
    this.languageName,
    this.status,
  });

  factory LanguageResult.fromJson(Map<String, dynamic> json) => LanguageResult(
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