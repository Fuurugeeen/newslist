// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class NewsDBData extends DataClass implements Insertable<NewsDBData> {
  final int id;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  NewsDBData(
      {required this.id,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});
  factory NewsDBData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return NewsDBData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      urlToImage: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url_to_image'])!,
      publishedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}published_at'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['author'] = Variable<String>(author);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['url'] = Variable<String>(url);
    map['url_to_image'] = Variable<String>(urlToImage);
    map['published_at'] = Variable<String>(publishedAt);
    map['content'] = Variable<String>(content);
    return map;
  }

  NewsDBCompanion toCompanion(bool nullToAbsent) {
    return NewsDBCompanion(
      id: Value(id),
      author: Value(author),
      title: Value(title),
      description: Value(description),
      url: Value(url),
      urlToImage: Value(urlToImage),
      publishedAt: Value(publishedAt),
      content: Value(content),
    );
  }

  factory NewsDBData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsDBData(
      id: serializer.fromJson<int>(json['id']),
      author: serializer.fromJson<String>(json['author']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      url: serializer.fromJson<String>(json['url']),
      urlToImage: serializer.fromJson<String>(json['urlToImage']),
      publishedAt: serializer.fromJson<String>(json['publishedAt']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'author': serializer.toJson<String>(author),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'url': serializer.toJson<String>(url),
      'urlToImage': serializer.toJson<String>(urlToImage),
      'publishedAt': serializer.toJson<String>(publishedAt),
      'content': serializer.toJson<String>(content),
    };
  }

  NewsDBData copyWith(
          {int? id,
          String? author,
          String? title,
          String? description,
          String? url,
          String? urlToImage,
          String? publishedAt,
          String? content}) =>
      NewsDBData(
        id: id ?? this.id,
        author: author ?? this.author,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishedAt: publishedAt ?? this.publishedAt,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('NewsDBData(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, author, title, description, url, urlToImage, publishedAt, content);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsDBData &&
          other.id == this.id &&
          other.author == this.author &&
          other.title == this.title &&
          other.description == this.description &&
          other.url == this.url &&
          other.urlToImage == this.urlToImage &&
          other.publishedAt == this.publishedAt &&
          other.content == this.content);
}

class NewsDBCompanion extends UpdateCompanion<NewsDBData> {
  final Value<int> id;
  final Value<String> author;
  final Value<String> title;
  final Value<String> description;
  final Value<String> url;
  final Value<String> urlToImage;
  final Value<String> publishedAt;
  final Value<String> content;
  const NewsDBCompanion({
    this.id = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.content = const Value.absent(),
  });
  NewsDBCompanion.insert({
    this.id = const Value.absent(),
    required String author,
    required String title,
    required String description,
    required String url,
    required String urlToImage,
    required String publishedAt,
    required String content,
  })  : author = Value(author),
        title = Value(title),
        description = Value(description),
        url = Value(url),
        urlToImage = Value(urlToImage),
        publishedAt = Value(publishedAt),
        content = Value(content);
  static Insertable<NewsDBData> custom({
    Expression<int>? id,
    Expression<String>? author,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? url,
    Expression<String>? urlToImage,
    Expression<String>? publishedAt,
    Expression<String>? content,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (publishedAt != null) 'published_at': publishedAt,
      if (content != null) 'content': content,
    });
  }

  NewsDBCompanion copyWith(
      {Value<int>? id,
      Value<String>? author,
      Value<String>? title,
      Value<String>? description,
      Value<String>? url,
      Value<String>? urlToImage,
      Value<String>? publishedAt,
      Value<String>? content}) {
    return NewsDBCompanion(
      id: id ?? this.id,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishedAt: publishedAt ?? this.publishedAt,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<String>(publishedAt.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsDBCompanion(')
          ..write('id: $id, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $NewsDBTable extends NewsDB with TableInfo<$NewsDBTable, NewsDBData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsDBTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _urlToImageMeta = const VerificationMeta('urlToImage');
  @override
  late final GeneratedColumn<String?> urlToImage = GeneratedColumn<String?>(
      'url_to_image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _publishedAtMeta =
      const VerificationMeta('publishedAt');
  @override
  late final GeneratedColumn<String?> publishedAt = GeneratedColumn<String?>(
      'published_at', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, author, title, description, url, urlToImage, publishedAt, content];
  @override
  String get aliasedName => _alias ?? 'news_d_b';
  @override
  String get actualTableName => 'news_d_b';
  @override
  VerificationContext validateIntegrity(Insertable<NewsDBData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image']!, _urlToImageMeta));
    } else if (isInserting) {
      context.missing(_urlToImageMeta);
    }
    if (data.containsKey('published_at')) {
      context.handle(
          _publishedAtMeta,
          publishedAt.isAcceptableOrUnknown(
              data['published_at']!, _publishedAtMeta));
    } else if (isInserting) {
      context.missing(_publishedAtMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NewsDBData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return NewsDBData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $NewsDBTable createAlias(String alias) {
    return $NewsDBTable(attachedDatabase, alias);
  }
}

abstract class _$NewsDatabase extends GeneratedDatabase {
  _$NewsDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $NewsDBTable newsDB = $NewsDBTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [newsDB];
}
