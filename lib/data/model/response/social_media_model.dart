class SocialMedia {
  int? id;
  String? name;
  String? link;
  String? iconUrl;

  SocialMedia({
    this.id,
    this.name,
    this.link,
    this.iconUrl,
  });

  SocialMedia.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    link = json["link"];
    iconUrl = json["icon_url"];
  }
}
