class Content {
  String id = '', ownerId = '', slug = '', title = '', ownerUsername = '';

  String? parentId, sourceUrl;

  var status = ContentStatus.none;

  DateTime createdAt = DateTime.now(),
      updatedAt = DateTime.now(),
      publishedAt = DateTime.now();

  DateTime? deletedAt;

  int tabcoins = 0, childrenDeepCount = 0;

  Content(
      this.id,
      this.ownerId,
      this.slug,
      this.title,
      this.ownerUsername,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.publishedAt,
      this.tabcoins,
      this.childrenDeepCount,
      {this.parentId,
      this.sourceUrl,
      this.deletedAt});

  @override
  String toString() {
    String str = 'id:$id, ownerId:$ownerId, slug:$slug, title:$title, ownerUsername:$ownerUsername, status:$status, createdAt:$createdAt, updatedAt:$updatedAt, publishedAt:$publishedAt, tabcoins:$tabcoins, childrenDeepCount:$childrenDeepCount';

    if (parentId != null) str += ', parentId: $parentId';
    if (sourceUrl != null) str += ', sourceUrl: $sourceUrl';
    if (deletedAt != null) str += ', deletedAt: $deletedAt';

    return str;
  }
}

enum ContentStatus { none, published }

enum ContentFetchStrategy { newFirst, old, relevant }

class ContentList {
  List<Content> list = [];

  void add(Content content) {
    list.add(content);
  }

  @override
  String toString() {
    return list.map((e) => e.toString()).reduce((value, element) => '$value\n$element');
  }
}
