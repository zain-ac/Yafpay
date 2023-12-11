class UpdateTagResponse {
  bool? error;
  TagResult? result;
  String? message;
  int? statusCode;

  UpdateTagResponse({
    this.error,
    this.result,
    this.message,
    this.statusCode,
  });

  factory UpdateTagResponse.fromJson(Map<String, dynamic> json) => UpdateTagResponse(
    error: json["error"],
    result: json["result"] == null ? null : TagResult.fromJson(json["result"]),
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

class TagResult {
  String? yafpayTag;

  TagResult({
    this.yafpayTag,
  });

  factory TagResult.fromJson(Map<String, dynamic> json) => TagResult(
    yafpayTag: json["yafpayTag"],
  );

  Map<String, dynamic> toJson() => {
    "yafpayTag": yafpayTag,
  };
}
