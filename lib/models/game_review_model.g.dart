// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_review_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGameReviewCollection on Isar {
  IsarCollection<GameReview> get gameReviews => this.collection();
}

const GameReviewSchema = CollectionSchema(
  name: r'GameReview',
  id: 8615129491403741827,
  properties: {
    r'awayTeamLineup': PropertySchema(
      id: 0,
      name: r'awayTeamLineup',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'food': PropertySchema(
      id: 2,
      name: r'food',
      type: IsarType.string,
    ),
    r'homeTeamLineup': PropertySchema(
      id: 3,
      name: r'homeTeamLineup',
      type: IsarType.string,
    ),
    r'mood': PropertySchema(
      id: 4,
      name: r'mood',
      type: IsarType.string,
    ),
    r'playerOfTheMatch': PropertySchema(
      id: 5,
      name: r'playerOfTheMatch',
      type: IsarType.string,
    ),
    r'rating': PropertySchema(
      id: 6,
      name: r'rating',
      type: IsarType.long,
    ),
    r'reviewComment': PropertySchema(
      id: 7,
      name: r'reviewComment',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _gameReviewEstimateSize,
  serialize: _gameReviewSerialize,
  deserialize: _gameReviewDeserialize,
  deserializeProp: _gameReviewDeserializeProp,
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
    ),
    r'updatedAt': IndexSchema(
      id: -6238191080293565125,
      name: r'updatedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'updatedAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'gameResult': LinkSchema(
      id: 118184521962627919,
      name: r'gameResult',
      target: r'GameResult',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _gameReviewGetId,
  getLinks: _gameReviewGetLinks,
  attach: _gameReviewAttach,
  version: '3.1.0+1',
);

int _gameReviewEstimateSize(
  GameReview object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.awayTeamLineup;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.food;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.homeTeamLineup;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mood;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.playerOfTheMatch;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.reviewComment;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _gameReviewSerialize(
  GameReview object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.awayTeamLineup);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.food);
  writer.writeString(offsets[3], object.homeTeamLineup);
  writer.writeString(offsets[4], object.mood);
  writer.writeString(offsets[5], object.playerOfTheMatch);
  writer.writeLong(offsets[6], object.rating);
  writer.writeString(offsets[7], object.reviewComment);
  writer.writeDateTime(offsets[8], object.updatedAt);
}

GameReview _gameReviewDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GameReview();
  object.awayTeamLineup = reader.readStringOrNull(offsets[0]);
  object.createdAt = reader.readDateTime(offsets[1]);
  object.food = reader.readStringOrNull(offsets[2]);
  object.homeTeamLineup = reader.readStringOrNull(offsets[3]);
  object.id = id;
  object.mood = reader.readStringOrNull(offsets[4]);
  object.playerOfTheMatch = reader.readStringOrNull(offsets[5]);
  object.rating = reader.readLongOrNull(offsets[6]);
  object.reviewComment = reader.readStringOrNull(offsets[7]);
  object.updatedAt = reader.readDateTime(offsets[8]);
  return object;
}

P _gameReviewDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gameReviewGetId(GameReview object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _gameReviewGetLinks(GameReview object) {
  return [object.gameResult];
}

void _gameReviewAttach(IsarCollection<dynamic> col, Id id, GameReview object) {
  object.id = id;
  object.gameResult
      .attach(col, col.isar.collection<GameResult>(), r'gameResult', id);
}

extension GameReviewQueryWhereSort
    on QueryBuilder<GameReview, GameReview, QWhere> {
  QueryBuilder<GameReview, GameReview, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterWhere> anyUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updatedAt'),
      );
    });
  }
}

extension GameReviewQueryWhere
    on QueryBuilder<GameReview, GameReview, QWhereClause> {
  QueryBuilder<GameReview, GameReview, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<GameReview, GameReview, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterWhereClause> idBetween(
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

  QueryBuilder<GameReview, GameReview, QAfterWhereClause> createdAtEqualTo(
      DateTime createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterWhereClause> createdAtNotEqualTo(
      DateTime createdAt) {
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

  QueryBuilder<GameReview, GameReview, QAfterWhereClause> createdAtGreaterThan(
    DateTime createdAt, {
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

  QueryBuilder<GameReview, GameReview, QAfterWhereClause> createdAtLessThan(
    DateTime createdAt, {
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

  QueryBuilder<GameReview, GameReview, QAfterWhereClause> createdAtBetween(
    DateTime lowerCreatedAt,
    DateTime upperCreatedAt, {
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

  QueryBuilder<GameReview, GameReview, QAfterWhereClause> updatedAtEqualTo(
      DateTime updatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [updatedAt],
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterWhereClause> updatedAtNotEqualTo(
      DateTime updatedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [],
              upper: [updatedAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [updatedAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [updatedAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'updatedAt',
              lower: [],
              upper: [updatedAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterWhereClause> updatedAtGreaterThan(
    DateTime updatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [updatedAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterWhereClause> updatedAtLessThan(
    DateTime updatedAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [],
        upper: [updatedAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterWhereClause> updatedAtBetween(
    DateTime lowerUpdatedAt,
    DateTime upperUpdatedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [lowerUpdatedAt],
        includeLower: includeLower,
        upper: [upperUpdatedAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GameReviewQueryFilter
    on QueryBuilder<GameReview, GameReview, QFilterCondition> {
  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'awayTeamLineup',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'awayTeamLineup',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'awayTeamLineup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'awayTeamLineup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'awayTeamLineup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'awayTeamLineup',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'awayTeamLineup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'awayTeamLineup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'awayTeamLineup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'awayTeamLineup',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'awayTeamLineup',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'awayTeamLineup',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      createdAtGreaterThan(
    DateTime value, {
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

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
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

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> foodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'food',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> foodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'food',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> foodEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'food',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> foodGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'food',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> foodLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'food',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> foodBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'food',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> foodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'food',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> foodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'food',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> foodContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'food',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> foodMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'food',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> foodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'food',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> foodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'food',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'homeTeamLineup',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'homeTeamLineup',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'homeTeamLineup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'homeTeamLineup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'homeTeamLineup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'homeTeamLineup',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'homeTeamLineup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'homeTeamLineup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'homeTeamLineup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'homeTeamLineup',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'homeTeamLineup',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'homeTeamLineup',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> idBetween(
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

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> moodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mood',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> moodIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mood',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> moodEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mood',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> moodGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mood',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> moodLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mood',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> moodBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mood',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> moodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mood',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> moodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mood',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> moodContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mood',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> moodMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mood',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> moodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mood',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> moodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mood',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      playerOfTheMatchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'playerOfTheMatch',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      playerOfTheMatchIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'playerOfTheMatch',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      playerOfTheMatchEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerOfTheMatch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      playerOfTheMatchGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playerOfTheMatch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      playerOfTheMatchLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playerOfTheMatch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      playerOfTheMatchBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playerOfTheMatch',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      playerOfTheMatchStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'playerOfTheMatch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      playerOfTheMatchEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'playerOfTheMatch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      playerOfTheMatchContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'playerOfTheMatch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      playerOfTheMatchMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'playerOfTheMatch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      playerOfTheMatchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playerOfTheMatch',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      playerOfTheMatchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'playerOfTheMatch',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> ratingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      ratingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> ratingEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: value,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> ratingGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rating',
        value: value,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> ratingLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rating',
        value: value,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> ratingBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      reviewCommentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reviewComment',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      reviewCommentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reviewComment',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      reviewCommentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewComment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      reviewCommentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reviewComment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      reviewCommentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reviewComment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      reviewCommentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reviewComment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      reviewCommentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reviewComment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      reviewCommentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reviewComment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      reviewCommentContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reviewComment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      reviewCommentMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reviewComment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      reviewCommentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewComment',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      reviewCommentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reviewComment',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> updatedAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GameReviewQueryObject
    on QueryBuilder<GameReview, GameReview, QFilterCondition> {}

extension GameReviewQueryLinks
    on QueryBuilder<GameReview, GameReview, QFilterCondition> {
  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> gameResult(
      FilterQuery<GameResult> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'gameResult');
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      gameResultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'gameResult', 0, true, 0, true);
    });
  }
}

extension GameReviewQuerySortBy
    on QueryBuilder<GameReview, GameReview, QSortBy> {
  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByAwayTeamLineup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awayTeamLineup', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy>
      sortByAwayTeamLineupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awayTeamLineup', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByFood() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'food', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByFoodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'food', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByHomeTeamLineup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeTeamLineup', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy>
      sortByHomeTeamLineupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeTeamLineup', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByMood() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mood', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByMoodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mood', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByPlayerOfTheMatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerOfTheMatch', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy>
      sortByPlayerOfTheMatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerOfTheMatch', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByReviewComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewComment', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByReviewCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewComment', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension GameReviewQuerySortThenBy
    on QueryBuilder<GameReview, GameReview, QSortThenBy> {
  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByAwayTeamLineup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awayTeamLineup', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy>
      thenByAwayTeamLineupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'awayTeamLineup', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByFood() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'food', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByFoodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'food', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByHomeTeamLineup() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeTeamLineup', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy>
      thenByHomeTeamLineupDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'homeTeamLineup', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByMood() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mood', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByMoodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mood', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByPlayerOfTheMatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerOfTheMatch', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy>
      thenByPlayerOfTheMatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playerOfTheMatch', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByReviewComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewComment', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByReviewCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewComment', Sort.desc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension GameReviewQueryWhereDistinct
    on QueryBuilder<GameReview, GameReview, QDistinct> {
  QueryBuilder<GameReview, GameReview, QDistinct> distinctByAwayTeamLineup(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'awayTeamLineup',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameReview, GameReview, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<GameReview, GameReview, QDistinct> distinctByFood(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'food', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameReview, GameReview, QDistinct> distinctByHomeTeamLineup(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'homeTeamLineup',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameReview, GameReview, QDistinct> distinctByMood(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mood', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameReview, GameReview, QDistinct> distinctByPlayerOfTheMatch(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playerOfTheMatch',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameReview, GameReview, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<GameReview, GameReview, QDistinct> distinctByReviewComment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reviewComment',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameReview, GameReview, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension GameReviewQueryProperty
    on QueryBuilder<GameReview, GameReview, QQueryProperty> {
  QueryBuilder<GameReview, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GameReview, String?, QQueryOperations> awayTeamLineupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'awayTeamLineup');
    });
  }

  QueryBuilder<GameReview, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<GameReview, String?, QQueryOperations> foodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'food');
    });
  }

  QueryBuilder<GameReview, String?, QQueryOperations> homeTeamLineupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'homeTeamLineup');
    });
  }

  QueryBuilder<GameReview, String?, QQueryOperations> moodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mood');
    });
  }

  QueryBuilder<GameReview, String?, QQueryOperations>
      playerOfTheMatchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playerOfTheMatch');
    });
  }

  QueryBuilder<GameReview, int?, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<GameReview, String?, QQueryOperations> reviewCommentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reviewComment');
    });
  }

  QueryBuilder<GameReview, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
