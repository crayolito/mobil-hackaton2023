class urlResponse {
  String url;

  urlResponse({
    required this.url,
  });

  factory urlResponse.fromJson(Map<String, dynamic> json) => urlResponse(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
