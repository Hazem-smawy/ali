class FatawaData {
  String? pid;
  String? title;
  String? content;
  String? img;
  String? attatches;
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
  String? options;
  String? cid;

  FatawaData(
      {this.pid,
      this.title,
      this.content,
      this.img,
      this.attatches,
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
      this.options,
      this.cid});

  FatawaData.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    title = json['title'];
    content = json['content'];
    img = json['img'];
    attatches = json['attatches'];
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
    options = json['options'];
    cid = json['cid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['title'] = this.title;
    data['content'] = this.content;
    data['img'] = this.img;
    data['attatches'] = this.attatches;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['published_at'] = this.publishedAt;
    data['published_at_gmt'] = this.publishedAtGmt;
    data['created_at'] = this.createdAt;
    data['created_at_gmt'] = this.createdAtGmt;
    data['created_by'] = this.createdBy;
    data['modified_at'] = this.modifiedAt;
    data['modified_at_gmt'] = this.modifiedAtGmt;
    data['modified_by'] = this.modifiedBy;
    data['views'] = this.views;
    data['status'] = this.status;
    data['guide'] = this.guide;
    data['options'] = this.options;
    data['cid'] = this.cid;
    return data;
  }
}