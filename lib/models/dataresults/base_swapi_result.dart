class BaseSwapiResult {
    String name;
    DateTime created;
    DateTime edited;
    String url;

    BaseSwapiResult({
        required this.name,
        required this.created,
        required this.edited,
        required this.url,
    });

    factory BaseSwapiResult.fromJson(Map<String, dynamic> json) => BaseSwapiResult(
        name: json["name"],
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
    };
}