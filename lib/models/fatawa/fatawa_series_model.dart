class FatawaModel {
  String? cid;
  String? title;
  String? content;
  String? img;
  String? publishedAt;
  String? views;
  String? status;
  String? guide;
  String? sections;
  String? postscount;

  FatawaModel(
      {this.cid,
      this.title,
      this.content,
      this.img,
      this.publishedAt,
      this.views,
      this.status,
      this.guide,
      this.sections,
      this.postscount});

  FatawaModel.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    title = json['title'];
    content = json['content'];
    img = json['img'];
    publishedAt = json['published_at'];
    views = json['views'];
    status = json['status'];
    guide = json['guide'];
    sections = json['sections'];
    postscount = json['postscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cid'] = cid;
    data['title'] = title;
    data['content'] = content;
    data['img'] = img;
    data['published_at'] = publishedAt;
    data['views'] = views;
    data['status'] = status;
    data['guide'] = guide;
    data['sections'] = sections;
    data['postscount'] = postscount;
    return data;
  }
}
