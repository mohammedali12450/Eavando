class SocialMedia {
  int id;
  String name;
  String link;
  String iconUrl;

  SocialMedia({
    required this.id,
    required this.name,
    required this.link,
    required this.iconUrl,
  });

  SocialMedia.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? -1,
        name = json["name"] ?? "",
        link = json["link"] ?? "",
        iconUrl = json["icon_url"] ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["name"] = this.name;
    data["link"] = this.link;
    data["icon_url"] = this.iconUrl;
    return data;
  }
}
