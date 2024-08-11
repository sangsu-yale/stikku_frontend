// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_result_id_mapping_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGameResultIdMappingCollection on Isar {
  IsarCollection<GameResultIdMapping> get gameResultIdMappings =>
      this.collection();
}

const GameResultIdMappingSchema = CollectionSchema(
  name: r'GameResultIdMapping',
  id: -1066852131855465502,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'localGameResultId': PropertySchema(
      id: 1,
      name: r'localGameResultId',
      type: IsarType.long,
    ),
    r'serverGameResultId': PropertySchema(
      id: 2,
      name: r'serverGameResultId',
      type: IsarType.long,
    ),
    r'serverGameReviewId': PropertySchema(
      id: 3,
      name: r'serverGameReviewId',
      type: IsarType.long,
    )
  },
  estimateSize: _gameResultIdMappingEstimateSize,
  serialize: _gameResultIdMappingSerialize,
  deserialize: _gameResultIdMappingDeserialize,
  deserializeProp: _gameResultIdMappingDeserializeProp,
  idName: r'id',
  indexes: {
    r'createdAt': IndexSchema(
      id: -3433535483987302584,
      name: r'createdAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'createdAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _gameResultIdMappingGetId,
  getLinks: _gameResultIdMappingGetLinks,
  attach: _gameResultIdMappingAttach,
  version: '3.1.0+1',
);

int _gameResultIdMappingEstimateSize(
  GameResultIdMapping object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _gameResultIdMappingSerialize(
  GameResultIdMapping object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeLong(offsets[1], object.localGameResultId);
  writer.writeLong(offsets[2], object.serverGameResultId);
  writer.writeLong(offsets[3], object.serverGameReviewId);
}

GameResultIdMapping _gameResultIdMappingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GameResultIdMapping(
    createdAt: reader.readDateTimeOrNull(offsets[0]),
    localGameResultId: reader.readLong(offsets[1]),
    serverGameResultId: reader.readLong(offsets[2]),
    serverGameReviewId: reader.readLong(offsets[3]),
  );
  object.id = id;
  return object;
}

P _gameResultIdMappingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gameResultIdMappingGetId(GameResultIdMapping object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _gameResultIdMappingGetLinks(
    GameResultIdMapping object) {
  return [];
}

void _gameResultIdMappingAttach(
    IsarCollection<dynamic> col, Id id, GameResultIdMapping object) {
  object.id = id;
}

extension GameResultIdMappingQueryWhereSort
    on QueryBuilder<GameResultIdMapping, GameResultIdMapping, QWhere> {
  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterWhere>
      anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }
}

extension GameResultIdMappingQueryWhere
    on QueryBuilder<GameResultIdMapping, GameResultIdMapping, QWhereClause> {
  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterWhereClause>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterWhereClause>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterWhereClause>
      createdAtEqualTo(DateTime? createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterWhereClause>
      createdAtNotEqualTo(DateTime? createdAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [createdAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'createdAt',
              lower: [],
              upper: [createdAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterWhereClause>
      createdAtGreaterThan(
    DateTime? createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [createdAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterWhereClause>
      createdAtLessThan(
    DateTime? createdAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [],
        upper: [createdAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterWhereClause>
      createdAtBetween(
    DateTime? lowerCreatedAt,
    DateTime? upperCreatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [lowerCreatedAt],
        includeLower: includeLower,
        upper: [upperCreatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GameResultIdMappingQueryFilter on QueryBuilder<GameResultIdMapping,
    GameResultIdMapping, QFilterCondition> {
  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      createdAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      localGameResultIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'localGameResultId',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      localGameResultIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'localGameResultId',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      localGameResultIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'localGameResultId',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      localGameResultIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'localGameResultId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      serverGameResultIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverGameResultId',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      serverGameResultIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverGameResultId',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      serverGameResultIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverGameResultId',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      serverGameResultIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverGameResultId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      serverGameReviewIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'serverGameReviewId',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      serverGameReviewIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'serverGameReviewId',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      serverGameReviewIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'serverGameReviewId',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterFilterCondition>
      serverGameReviewIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'serverGameReviewId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GameResultIdMappingQueryObject on QueryBuilder<GameResultIdMapping,
    GameResultIdMapping, QFilterCondition> {}

extension GameResultIdMappingQueryLinks on QueryBuilder<GameResultIdMapping,
    GameResultIdMapping, QFilterCondition> {}

extension GameResultIdMappingQuerySortBy
    on QueryBuilder<GameResultIdMapping, GameResultIdMapping, QSortBy> {
  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      sortByLocalGameResultId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localGameResultId', Sort.asc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      sortByLocalGameResultIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localGameResultId', Sort.desc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      sortByServerGameResultId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverGameResultId', Sort.asc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      sortByServerGameResultIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverGameResultId', Sort.desc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      sortByServerGameReviewId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverGameReviewId', Sort.asc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      sortByServerGameReviewIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverGameReviewId', Sort.desc);
    });
  }
}

extension GameResultIdMappingQuerySortThenBy
    on QueryBuilder<GameResultIdMapping, GameResultIdMapping, QSortThenBy> {
  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      thenByLocalGameResultId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localGameResultId', Sort.asc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      thenByLocalGameResultIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'localGameResultId', Sort.desc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      thenByServerGameResultId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverGameResultId', Sort.asc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      thenByServerGameResultIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverGameResultId', Sort.desc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      thenByServerGameReviewId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverGameReviewId', Sort.asc);
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QAfterSortBy>
      thenByServerGameReviewIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'serverGameReviewId', Sort.desc);
    });
  }
}

extension GameResultIdMappingQueryWhereDistinct
    on QueryBuilder<GameResultIdMapping, GameResultIdMapping, QDistinct> {
  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QDistinct>
      distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QDistinct>
      distinctByLocalGameResultId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'localGameResultId');
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QDistinct>
      distinctByServerGameResultId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverGameResultId');
    });
  }

  QueryBuilder<GameResultIdMapping, GameResultIdMapping, QDistinct>
      distinctByServerGameReviewId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'serverGameReviewId');
    });
  }
}

extension GameResultIdMappingQueryProperty
    on QueryBuilder<GameResultIdMapping, GameResultIdMapping, QQueryProperty> {
  QueryBuilder<GameResultIdMapping, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GameResultIdMapping, DateTime?, QQueryOperations>
      createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<GameResultIdMapping, int, QQueryOperations>
      localGameResultIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'localGameResultId');
    });
  }

  QueryBuilder<GameResultIdMapping, int, QQueryOperations>
      serverGameResultIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverGameResultId');
    });
  }

  QueryBuilder<GameResultIdMapping, int, QQueryOperations>
      serverGameReviewIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'serverGameReviewId');
    });
  }
}
