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
      type: IsarType.stringList,
    ),
    r'food': PropertySchema(
      id: 1,
      name: r'food',
      type: IsarType.string,
    ),
    r'homeTeamLineup': PropertySchema(
      id: 2,
      name: r'homeTeamLineup',
      type: IsarType.stringList,
    ),
    r'mood': PropertySchema(
      id: 3,
      name: r'mood',
      type: IsarType.string,
    ),
    r'playerOfTheMatch': PropertySchema(
      id: 4,
      name: r'playerOfTheMatch',
      type: IsarType.string,
    ),
    r'rating': PropertySchema(
      id: 5,
      name: r'rating',
      type: IsarType.long,
    ),
    r'review': PropertySchema(
      id: 6,
      name: r'review',
      type: IsarType.string,
    )
  },
  estimateSize: _gameReviewEstimateSize,
  serialize: _gameReviewSerialize,
  deserialize: _gameReviewDeserialize,
  deserializeProp: _gameReviewDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
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
    final list = object.awayTeamLineup;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.food;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.homeTeamLineup;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
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
    final value = object.review;
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
  writer.writeStringList(offsets[0], object.awayTeamLineup);
  writer.writeString(offsets[1], object.food);
  writer.writeStringList(offsets[2], object.homeTeamLineup);
  writer.writeString(offsets[3], object.mood);
  writer.writeString(offsets[4], object.playerOfTheMatch);
  writer.writeLong(offsets[5], object.rating);
  writer.writeString(offsets[6], object.review);
}

GameReview _gameReviewDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GameReview(
    awayTeamLineup: reader.readStringList(offsets[0]),
    food: reader.readStringOrNull(offsets[1]),
    homeTeamLineup: reader.readStringList(offsets[2]),
    mood: reader.readStringOrNull(offsets[3]),
    playerOfTheMatch: reader.readStringOrNull(offsets[4]),
    rating: reader.readLongOrNull(offsets[5]),
    review: reader.readStringOrNull(offsets[6]),
  );
  object.id = id;
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
      return (reader.readStringList(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringList(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _gameReviewGetId(GameReview object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _gameReviewGetLinks(GameReview object) {
  return [];
}

void _gameReviewAttach(IsarCollection<dynamic> col, Id id, GameReview object) {
  object.id = id;
}

extension GameReviewQueryWhereSort
    on QueryBuilder<GameReview, GameReview, QWhere> {
  QueryBuilder<GameReview, GameReview, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
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
      awayTeamLineupElementEqualTo(
    String value, {
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
      awayTeamLineupElementGreaterThan(
    String value, {
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
      awayTeamLineupElementLessThan(
    String value, {
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
      awayTeamLineupElementBetween(
    String lower,
    String upper, {
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
      awayTeamLineupElementStartsWith(
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
      awayTeamLineupElementEndsWith(
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
      awayTeamLineupElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'awayTeamLineup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'awayTeamLineup',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'awayTeamLineup',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'awayTeamLineup',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'awayTeamLineup',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'awayTeamLineup',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'awayTeamLineup',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'awayTeamLineup',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'awayTeamLineup',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      awayTeamLineupLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'awayTeamLineup',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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
      homeTeamLineupElementEqualTo(
    String value, {
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
      homeTeamLineupElementGreaterThan(
    String value, {
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
      homeTeamLineupElementLessThan(
    String value, {
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
      homeTeamLineupElementBetween(
    String lower,
    String upper, {
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
      homeTeamLineupElementStartsWith(
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
      homeTeamLineupElementEndsWith(
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
      homeTeamLineupElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'homeTeamLineup',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'homeTeamLineup',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'homeTeamLineup',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'homeTeamLineup',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'homeTeamLineup',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'homeTeamLineup',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'homeTeamLineup',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'homeTeamLineup',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'homeTeamLineup',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      homeTeamLineupLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'homeTeamLineup',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> reviewIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'review',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      reviewIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'review',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> reviewEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'review',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> reviewGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'review',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> reviewLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'review',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> reviewBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'review',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> reviewStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'review',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> reviewEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'review',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> reviewContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'review',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> reviewMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'review',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition> reviewIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'review',
        value: '',
      ));
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterFilterCondition>
      reviewIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'review',
        value: '',
      ));
    });
  }
}

extension GameReviewQueryObject
    on QueryBuilder<GameReview, GameReview, QFilterCondition> {}

extension GameReviewQueryLinks
    on QueryBuilder<GameReview, GameReview, QFilterCondition> {}

extension GameReviewQuerySortBy
    on QueryBuilder<GameReview, GameReview, QSortBy> {
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

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByReview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'review', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> sortByReviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'review', Sort.desc);
    });
  }
}

extension GameReviewQuerySortThenBy
    on QueryBuilder<GameReview, GameReview, QSortThenBy> {
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

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByReview() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'review', Sort.asc);
    });
  }

  QueryBuilder<GameReview, GameReview, QAfterSortBy> thenByReviewDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'review', Sort.desc);
    });
  }
}

extension GameReviewQueryWhereDistinct
    on QueryBuilder<GameReview, GameReview, QDistinct> {
  QueryBuilder<GameReview, GameReview, QDistinct> distinctByAwayTeamLineup() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'awayTeamLineup');
    });
  }

  QueryBuilder<GameReview, GameReview, QDistinct> distinctByFood(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'food', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameReview, GameReview, QDistinct> distinctByHomeTeamLineup() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'homeTeamLineup');
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

  QueryBuilder<GameReview, GameReview, QDistinct> distinctByReview(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'review', caseSensitive: caseSensitive);
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

  QueryBuilder<GameReview, List<String>?, QQueryOperations>
      awayTeamLineupProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'awayTeamLineup');
    });
  }

  QueryBuilder<GameReview, String?, QQueryOperations> foodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'food');
    });
  }

  QueryBuilder<GameReview, List<String>?, QQueryOperations>
      homeTeamLineupProperty() {
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

  QueryBuilder<GameReview, String?, QQueryOperations> reviewProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'review');
    });
  }
}
