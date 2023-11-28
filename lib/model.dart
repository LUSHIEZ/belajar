

class Buku {
  int? page;
  List<ReadingLogEntries>? readingLogEntries;

  Buku({
    this.page,
    this.readingLogEntries,
  });

  Buku.fromJson(Map<String, dynamic> json) {
    page = json['page'] as int?;
    readingLogEntries = (json['reading_log_entries'] as List?)?.map((dynamic e) => ReadingLogEntries.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['page'] = page;
    json['reading_log_entries'] = readingLogEntries?.map((e) => e.toJson()).toList();
    return json;
  }
}

class ReadingLogEntries {
  Work? work;
  String? loggedEdition;
  String? loggedDate;

  ReadingLogEntries({
    this.work,
    this.loggedEdition,
    this.loggedDate,
  });

  ReadingLogEntries.fromJson(Map<String, dynamic> json) {
    work = (json['work'] as Map<String,dynamic>?) != null ? Work.fromJson(json['work'] as Map<String,dynamic>) : null;
    loggedEdition = json['logged_edition'] as String?;
    loggedDate = json['logged_date'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['work'] = work?.toJson();
    json['logged_edition'] = loggedEdition;
    json['logged_date'] = loggedDate;
    return json;
  }
}

class Work {
  String? title;
  String? key;
  List<String>? authorKeys;
  List<String>? authorNames;
  int? firstPublishYear;
  String? lendingEditionS;
  List<String>? editionKey;
  int? coverId;
  String? coverEditionKey;

  Work({
    this.title,
    this.key,
    this.authorKeys,
    this.authorNames,
    this.firstPublishYear,
    this.lendingEditionS,
    this.editionKey,
    this.coverId,
    this.coverEditionKey,
  });

  Work.fromJson(Map<String, dynamic> json) {
    title = json['title'] as String?;
    key = json['key'] as String?;
    authorKeys = (json['author_keys'] as List?)?.map((dynamic e) => e as String).toList();
    authorNames = (json['author_names'] as List?)?.map((dynamic e) => e as String).toList();
    firstPublishYear = json['first_publish_year'] as int?;
    lendingEditionS = json['lending_edition_s'] as String?;
    editionKey = (json['edition_key'] as List?)?.map((dynamic e) => e as String).toList();
    coverId = json['cover_id'] as int?;
    coverEditionKey = json['cover_edition_key'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['title'] = title;
    json['key'] = key;
    json['author_keys'] = authorKeys;
    json['author_names'] = authorNames;
    json['first_publish_year'] = firstPublishYear;
    json['lending_edition_s'] = lendingEditionS;
    json['edition_key'] = editionKey;
    json['cover_id'] = coverId;
    json['cover_edition_key'] = coverEditionKey;
    return json;
  }
}