import 'dart:convert';

import 'package:flutter_application/models/dataresults/base_swapi_result.dart';

SwapiPage swapiPageFromJson(String str) => SwapiPage.fromJson(json.decode(str));

String swapiPageToJson(SwapiPage data) => json.encode(data.toJson());

class SwapiPage {
    int count;
    String? next;
    String? previous;
    List<BaseSwapiResult> results;

    SwapiPage({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    factory SwapiPage.fromJson(Map<String, dynamic> json) => SwapiPage(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<BaseSwapiResult>.from(json["results"].map((x) => BaseSwapiResult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}