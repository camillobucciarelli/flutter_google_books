// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class VolumesTable extends Table
    with TableInfo<VolumesTable, VolumesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  VolumesTable(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> publisher = GeneratedColumn<String>(
    'publisher',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  late final GeneratedColumn<int> publishedDate = GeneratedColumn<int>(
    'published_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  late final GeneratedColumn<String> authors = GeneratedColumn<String>(
    'authors',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    $customConstraints: 'NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    publisher,
    publishedDate,
    description,
    authors,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'volumes_table';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VolumesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VolumesTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      publisher: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}publisher'],
      ),
      publishedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}published_date'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      authors: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}authors'],
      ),
    );
  }

  @override
  VolumesTable createAlias(String alias) {
    return VolumesTable(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const ['PRIMARY KEY(id)'];
  @override
  bool get dontWriteConstraints => true;
}

class VolumesTableData extends DataClass
    implements Insertable<VolumesTableData> {
  final String id;
  final String title;
  final String? publisher;
  final int publishedDate;
  final String description;
  final String? authors;
  const VolumesTableData({
    required this.id,
    required this.title,
    this.publisher,
    required this.publishedDate,
    required this.description,
    this.authors,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || publisher != null) {
      map['publisher'] = Variable<String>(publisher);
    }
    map['published_date'] = Variable<int>(publishedDate);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || authors != null) {
      map['authors'] = Variable<String>(authors);
    }
    return map;
  }

  VolumesTableCompanion toCompanion(bool nullToAbsent) {
    return VolumesTableCompanion(
      id: Value(id),
      title: Value(title),
      publisher: publisher == null && nullToAbsent
          ? const Value.absent()
          : Value(publisher),
      publishedDate: Value(publishedDate),
      description: Value(description),
      authors: authors == null && nullToAbsent
          ? const Value.absent()
          : Value(authors),
    );
  }

  factory VolumesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VolumesTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      publisher: serializer.fromJson<String?>(json['publisher']),
      publishedDate: serializer.fromJson<int>(json['publishedDate']),
      description: serializer.fromJson<String>(json['description']),
      authors: serializer.fromJson<String?>(json['authors']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'publisher': serializer.toJson<String?>(publisher),
      'publishedDate': serializer.toJson<int>(publishedDate),
      'description': serializer.toJson<String>(description),
      'authors': serializer.toJson<String?>(authors),
    };
  }

  VolumesTableData copyWith({
    String? id,
    String? title,
    Value<String?> publisher = const Value.absent(),
    int? publishedDate,
    String? description,
    Value<String?> authors = const Value.absent(),
  }) => VolumesTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    publisher: publisher.present ? publisher.value : this.publisher,
    publishedDate: publishedDate ?? this.publishedDate,
    description: description ?? this.description,
    authors: authors.present ? authors.value : this.authors,
  );
  VolumesTableData copyWithCompanion(VolumesTableCompanion data) {
    return VolumesTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      publisher: data.publisher.present ? data.publisher.value : this.publisher,
      publishedDate: data.publishedDate.present
          ? data.publishedDate.value
          : this.publishedDate,
      description: data.description.present
          ? data.description.value
          : this.description,
      authors: data.authors.present ? data.authors.value : this.authors,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VolumesTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('publisher: $publisher, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('description: $description, ')
          ..write('authors: $authors')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, publisher, publishedDate, description, authors);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VolumesTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.publisher == this.publisher &&
          other.publishedDate == this.publishedDate &&
          other.description == this.description &&
          other.authors == this.authors);
}

class VolumesTableCompanion extends UpdateCompanion<VolumesTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> publisher;
  final Value<int> publishedDate;
  final Value<String> description;
  final Value<String?> authors;
  final Value<int> rowid;
  const VolumesTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.publisher = const Value.absent(),
    this.publishedDate = const Value.absent(),
    this.description = const Value.absent(),
    this.authors = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VolumesTableCompanion.insert({
    required String id,
    required String title,
    this.publisher = const Value.absent(),
    required int publishedDate,
    required String description,
    this.authors = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       publishedDate = Value(publishedDate),
       description = Value(description);
  static Insertable<VolumesTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? publisher,
    Expression<int>? publishedDate,
    Expression<String>? description,
    Expression<String>? authors,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (publisher != null) 'publisher': publisher,
      if (publishedDate != null) 'published_date': publishedDate,
      if (description != null) 'description': description,
      if (authors != null) 'authors': authors,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VolumesTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? publisher,
    Value<int>? publishedDate,
    Value<String>? description,
    Value<String?>? authors,
    Value<int>? rowid,
  }) {
    return VolumesTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      publisher: publisher ?? this.publisher,
      publishedDate: publishedDate ?? this.publishedDate,
      description: description ?? this.description,
      authors: authors ?? this.authors,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (publisher.present) {
      map['publisher'] = Variable<String>(publisher.value);
    }
    if (publishedDate.present) {
      map['published_date'] = Variable<int>(publishedDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (authors.present) {
      map['authors'] = Variable<String>(authors.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VolumesTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('publisher: $publisher, ')
          ..write('publishedDate: $publishedDate, ')
          ..write('description: $description, ')
          ..write('authors: $authors, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final VolumesTable volumesTable = VolumesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [volumesTable];
  @override
  int get schemaVersion => 2;
}
