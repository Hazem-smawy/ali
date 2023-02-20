class AudioItemModel {
  String? cid;
  String? title;
  String? content;
  String? img;
  String? metaKeywords;
  String? metaDescription;
  String? publishedAt;
  String? publishedAtGmt;
  String? createdAt;
  String? createdAtGmt;
  String? createdBy;
  String? modifiedAt;
  String? modifiedAtGmt;
  String? modifiedBy;
  String? views;
  String? status;
  String? guide;
  String? postCount;
  String? options;
  String? sections;
  String? postscount;

  AudioItemModel(
      {this.cid,
      this.title,
      this.content,
      this.img,
      this.metaKeywords,
      this.metaDescription,
      this.publishedAt,
      this.publishedAtGmt,
      this.createdAt,
      this.createdAtGmt,
      this.createdBy,
      this.modifiedAt,
      this.modifiedAtGmt,
      this.modifiedBy,
      this.views,
      this.status,
      this.guide,
      this.postCount,
      this.options,
      this.sections,
      this.postscount});

  AudioItemModel.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    title = json['title'];
    content = json['content'];
    img = json['img'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    publishedAt = json['published_at'];
    publishedAtGmt = json['published_at_gmt'];
    createdAt = json['created_at'];
    createdAtGmt = json['created_at_gmt'];
    createdBy = json['created_by'];
    modifiedAt = json['modified_at'];
    modifiedAtGmt = json['modified_at_gmt'];
    modifiedBy = json['modified_by'];
    views = json['views'];
    status = json['status'];
    guide = json['guide'];
    postCount = json['post_count'];
    options = json['options'];
    sections = json['sections'];
    postscount = json['postscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cid'] = cid;
    data['title'] = title;
    data['content'] = content;
    data['img'] = img;
    data['meta_keywords'] = metaKeywords;
    data['meta_description'] = metaDescription;
    data['published_at'] = publishedAt;
    data['published_at_gmt'] = publishedAtGmt;
    data['created_at'] = createdAt;
    data['created_at_gmt'] = createdAtGmt;
    data['created_by'] = createdBy;
    data['modified_at'] = modifiedAt;
    data['modified_at_gmt'] = modifiedAtGmt;
    data['modified_by'] = modifiedBy;
    data['views'] = views;
    data['status'] = status;
    data['guide'] = guide;
    data['post_count'] = postCount;
    data['options'] = options;
    data['sections'] = sections;
    data['postscount'] = postscount;
    return data;
  }
}
