// To parse this JSON data, do
//
//     final modelBanner = modelBannerFromJson(jsonString);

import 'dart:convert';

List<ModelBanner> modelBannerFromJson(String str) => List<ModelBanner>.from(json.decode(str).map((x) => ModelBanner.fromJson(x)));

String modelBannerToJson(List<ModelBanner> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelBanner {
  ModelBanner({
    this.bannerId,
    this.image,
    this.titile,
  });

  String? bannerId;
  String? image;
  String? titile;

  factory ModelBanner.fromJson(Map<String, dynamic> json) => ModelBanner(
    bannerId: json["banner_id"],
    image: json["image"],
    titile: json["titile"],
  );

  Map<String, dynamic> toJson() => {
    "banner_id": bannerId,
    "image": image,
    "titile": titile,
  };
}
