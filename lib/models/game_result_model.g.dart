// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_result_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGameResultCollection on Isar {
  IsarCollection<GameResult> get gameResults => this.collection();
}

const GameResultSchema = CollectionSchema(
  name: r'GameResult',
  id: 9132494934183461079,
  properties: {
    r'comment': PropertySchema(
      id: 0,
      name: r'comment',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'date': PropertySchema(
      id: 2,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'gameTitle': PropertySchema(
      id: 3,
      name: r'gameTitle',
      type: IsarType.string,
    ),
    r'isFavorite': PropertySchema(
      id: 4,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'pictureLocalPath': PropertySchema(
      id: 5,
      name: r'pictureLocalPath',
      type: IsarType.string,
    ),
    r'pictureUrl': PropertySchema(
      id: 6,
      name: r'pictureUrl',
      type: IsarType.string,
    ),
    r'result': PropertySchema(
      id: 7,
      name: r'result',
      type: IsarType.string,
      enumMap: _GameResultresultEnumValueMap,
    ),
    r'score1': PropertySchema(
      id: 8,
      name: r'score1',
      type: IsarType.string,
    ),
    r'score2': PropertySchema(
      id: 9,
      name: r'score2',
      type: IsarType.string,
    ),
    r'seatLocation': PropertySchema(
      id: 10,
      name: r'seatLocation',
      type: IsarType.string,
    ),
    r'stadium': PropertySchema(
      id: 11,
      name: r'stadium',
      type: IsarType.string,
    ),
    r'team1': PropertySchema(
      id: 12,
      name: r'team1',
      type: IsarType.string,
    ),
    r'team1IsMyTeam': PropertySchema(
      id: 13,
      name: r'team1IsMyTeam',
      type: IsarType.bool,
    ),
    r'team2': PropertySchema(
      id: 14,
      name: r'team2',
      type: IsarType.string,
    ),
    r'team2IsMyTeam': PropertySchema(
      id: 15,
      name: r'team2IsMyTeam',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 16,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'viewingMode': PropertySchema(
      id: 17,
      name: r'viewingMode',
      type: IsarType.bool,
    )
  },
  estimateSize: _gameResultEstimateSize,
  serialize: _gameResultSerialize,
  deserialize: _gameResultDeserialize,
  deserializeProp: _gameResultDeserializeProp,
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
    r'gameReview': LinkSchema(
      id: 8906921272517824541,
      name: r'gameReview',
      target: r'GameReview',
      single: true,
    ),
    r'user': LinkSchema(
      id: 8458269610400527945,
      name: r'user',
      target: r'User',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _gameResultGetId,
  getLinks: _gameResultGetLinks,
  attach: _gameResultAttach,
  version: '3.1.0+1',
);

int _gameResultEstimateSize(
  GameResult object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.comment;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gameTitle;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pictureLocalPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pictureUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.result;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.score1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.score2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.seatLocation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stadium;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.team1;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.team2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _gameResultSerialize(
  GameResult object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.comment);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeDateTime(offsets[2], object.date);
  writer.writeString(offsets[3], object.gameTitle);
  writer.writeBool(offsets[4], object.isFavorite);
  writer.writeString(offsets[5], object.pictureLocalPath);
  writer.writeString(offsets[6], object.pictureUrl);
  writer.writeString(offsets[7], object.result?.name);
  writer.writeString(offsets[8], object.score1);
  writer.writeString(offsets[9], object.score2);
  writer.writeString(offsets[10], object.seatLocation);
  writer.writeString(offsets[11], object.stadium);
  writer.writeString(offsets[12], object.team1);
  writer.writeBool(offsets[13], object.team1IsMyTeam);
  writer.writeString(offsets[14], object.team2);
  writer.writeBool(offsets[15], object.team2IsMyTeam);
  writer.writeDateTime(offsets[16], object.updatedAt);
  writer.writeBool(offsets[17], object.viewingMode);
}

GameResult _gameResultDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GameResult(
    comment: reader.readStringOrNull(offsets[0]),
    createdAt: reader.readDateTimeOrNull(offsets[1]),
    date: reader.readDateTimeOrNull(offsets[2]),
    gameTitle: reader.readStringOrNull(offsets[3]),
    isFavorite: reader.readBoolOrNull(offsets[4]) ?? false,
    pictureLocalPath: reader.readStringOrNull(offsets[5]),
    pictureUrl: reader.readStringOrNull(offsets[6]),
    result: _GameResultresultValueEnumMap[reader.readStringOrNull(offsets[7])],
    score1: reader.readStringOrNull(offsets[8]),
    score2: reader.readStringOrNull(offsets[9]),
    seatLocation: reader.readStringOrNull(offsets[10]),
    stadium: reader.readStringOrNull(offsets[11]),
    team1: reader.readStringOrNull(offsets[12]),
    team1IsMyTeam: reader.readBoolOrNull(offsets[13]) ?? false,
    team2: reader.readStringOrNull(offsets[14]),
    team2IsMyTeam: reader.readBoolOrNull(offsets[15]) ?? false,
    updatedAt: reader.readDateTimeOrNull(offsets[16]),
    viewingMode: reader.readBoolOrNull(offsets[17]) ?? false,
  );
  object.id = id;
  return object;
}

P _gameResultDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (_GameResultresultValueEnumMap[reader.readStringOrNull(offset)])
          as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 16:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 17:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _GameResultresultEnumValueMap = {
  r'WIN': r'WIN',
  r'LOSE': r'LOSE',
  r'TIE': r'TIE',
  r'CANCEL': r'CANCEL',
};
const _GameResultresultValueEnumMap = {
  r'WIN': GameResultType.WIN,
  r'LOSE': GameResultType.LOSE,
  r'TIE': GameResultType.TIE,
  r'CANCEL': GameResultType.CANCEL,
};

Id _gameResultGetId(GameResult object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _gameResultGetLinks(GameResult object) {
  return [object.gameReview, object.user];
}

void _gameResultAttach(IsarCollection<dynamic> col, Id id, GameResult object) {
  object.id = id;
  object.gameReview
      .attach(col, col.isar.collection<GameReview>(), r'gameReview', id);
  object.user.attach(col, col.isar.collection<User>(), r'user', id);
}

extension GameResultQueryWhereSort
    on QueryBuilder<GameResult, GameResult, QWhere> {
  QueryBuilder<GameResult, GameResult, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterWhere> anyCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'createdAt'),
      );
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterWhere> anyUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'updatedAt'),
      );
    });
  }
}

extension GameResultQueryWhere
    on QueryBuilder<GameResult, GameResult, QWhereClause> {
  QueryBuilder<GameResult, GameResult, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> idBetween(
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

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'createdAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> createdAtEqualTo(
      DateTime? createdAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'createdAt',
        value: [createdAt],
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> createdAtNotEqualTo(
      DateTime? createdAt) {
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

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> createdAtGreaterThan(
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

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> createdAtLessThan(
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

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> createdAtBetween(
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

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'updatedAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> updatedAtEqualTo(
      DateTime? updatedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'updatedAt',
        value: [updatedAt],
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> updatedAtNotEqualTo(
      DateTime? updatedAt) {
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

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> updatedAtGreaterThan(
    DateTime? updatedAt, {
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

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> updatedAtLessThan(
    DateTime? updatedAt, {
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

  QueryBuilder<GameResult, GameResult, QAfterWhereClause> updatedAtBetween(
    DateTime? lowerUpdatedAt,
    DateTime? upperUpdatedAt, {
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

extension GameResultQueryFilter
    on QueryBuilder<GameResult, GameResult, QFilterCondition> {
  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> commentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      commentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> commentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      commentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> commentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> commentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> commentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> commentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> commentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> commentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> commentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      commentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdAt',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> createdAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
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

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> dateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> dateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> dateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> dateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      gameTitleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gameTitle',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      gameTitleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gameTitle',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> gameTitleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gameTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      gameTitleGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gameTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> gameTitleLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gameTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> gameTitleBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gameTitle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      gameTitleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gameTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> gameTitleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gameTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> gameTitleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gameTitle',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> gameTitleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gameTitle',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      gameTitleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gameTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      gameTitleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gameTitle',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> idBetween(
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

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> isFavoriteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureLocalPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pictureLocalPath',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureLocalPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pictureLocalPath',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureLocalPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pictureLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureLocalPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pictureLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureLocalPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pictureLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureLocalPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pictureLocalPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureLocalPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pictureLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureLocalPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pictureLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureLocalPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pictureLocalPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureLocalPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pictureLocalPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureLocalPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pictureLocalPath',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureLocalPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pictureLocalPath',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pictureUrl',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pictureUrl',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> pictureUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pictureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pictureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pictureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> pictureUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pictureUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pictureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pictureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pictureUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> pictureUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pictureUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pictureUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      pictureUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pictureUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> resultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'result',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      resultIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'result',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> resultEqualTo(
    GameResultType? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'result',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> resultGreaterThan(
    GameResultType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'result',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> resultLessThan(
    GameResultType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'result',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> resultBetween(
    GameResultType? lower,
    GameResultType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'result',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> resultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'result',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> resultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'result',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> resultContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'result',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> resultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'result',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> resultIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'result',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      resultIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'result',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'score1',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      score1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'score1',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'score1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'score1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'score1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'score1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'score1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score1Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'score1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'score1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score1',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      score1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'score1',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'score2',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      score2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'score2',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'score2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'score2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'score2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'score2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'score2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score2Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'score2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'score2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> score2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'score2',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      score2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'score2',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      seatLocationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'seatLocation',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      seatLocationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'seatLocation',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      seatLocationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seatLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      seatLocationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'seatLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      seatLocationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'seatLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      seatLocationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'seatLocation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      seatLocationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'seatLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      seatLocationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'seatLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      seatLocationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'seatLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      seatLocationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'seatLocation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      seatLocationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'seatLocation',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      seatLocationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'seatLocation',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> stadiumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stadium',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      stadiumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stadium',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> stadiumEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stadium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      stadiumGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stadium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> stadiumLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stadium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> stadiumBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stadium',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> stadiumStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stadium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> stadiumEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stadium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> stadiumContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stadium',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> stadiumMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stadium',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> stadiumIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stadium',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      stadiumIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stadium',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team1IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'team1',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team1IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'team1',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team1EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'team1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team1GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'team1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team1LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'team1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team1Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'team1',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team1StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'team1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team1EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'team1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team1Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'team1',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team1Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'team1',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team1IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'team1',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      team1IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'team1',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      team1IsMyTeamEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'team1IsMyTeam',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'team2',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'team2',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'team2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'team2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'team2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'team2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'team2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'team2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team2Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'team2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'team2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> team2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'team2',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      team2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'team2',
        value: '',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      team2IsMyTeamEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'team2IsMyTeam',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
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

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> updatedAtLessThan(
    DateTime? value, {
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

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      viewingModeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'viewingMode',
        value: value,
      ));
    });
  }
}

extension GameResultQueryObject
    on QueryBuilder<GameResult, GameResult, QFilterCondition> {}

extension GameResultQueryLinks
    on QueryBuilder<GameResult, GameResult, QFilterCondition> {
  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> gameReview(
      FilterQuery<GameReview> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'gameReview');
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition>
      gameReviewIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'gameReview', 0, true, 0, true);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> user(
      FilterQuery<User> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'user');
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterFilterCondition> userIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'user', 0, true, 0, true);
    });
  }
}

extension GameResultQuerySortBy
    on QueryBuilder<GameResult, GameResult, QSortBy> {
  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByGameTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameTitle', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByGameTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameTitle', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByPictureLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pictureLocalPath', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy>
      sortByPictureLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pictureLocalPath', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByPictureUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pictureUrl', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByPictureUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pictureUrl', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'result', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByResultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'result', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByScore1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score1', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByScore1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score1', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByScore2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score2', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByScore2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score2', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortBySeatLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seatLocation', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortBySeatLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seatLocation', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByStadium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stadium', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByStadiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stadium', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByTeam1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team1', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByTeam1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team1', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByTeam1IsMyTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team1IsMyTeam', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByTeam1IsMyTeamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team1IsMyTeam', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByTeam2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team2', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByTeam2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team2', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByTeam2IsMyTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team2IsMyTeam', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByTeam2IsMyTeamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team2IsMyTeam', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByViewingMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewingMode', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> sortByViewingModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewingMode', Sort.desc);
    });
  }
}

extension GameResultQuerySortThenBy
    on QueryBuilder<GameResult, GameResult, QSortThenBy> {
  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByComment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByCommentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'comment', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByGameTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameTitle', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByGameTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gameTitle', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByPictureLocalPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pictureLocalPath', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy>
      thenByPictureLocalPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pictureLocalPath', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByPictureUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pictureUrl', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByPictureUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pictureUrl', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'result', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByResultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'result', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByScore1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score1', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByScore1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score1', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByScore2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score2', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByScore2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'score2', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenBySeatLocation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seatLocation', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenBySeatLocationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'seatLocation', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByStadium() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stadium', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByStadiumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stadium', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByTeam1() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team1', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByTeam1Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team1', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByTeam1IsMyTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team1IsMyTeam', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByTeam1IsMyTeamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team1IsMyTeam', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByTeam2() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team2', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByTeam2Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team2', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByTeam2IsMyTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team2IsMyTeam', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByTeam2IsMyTeamDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'team2IsMyTeam', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByViewingMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewingMode', Sort.asc);
    });
  }

  QueryBuilder<GameResult, GameResult, QAfterSortBy> thenByViewingModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'viewingMode', Sort.desc);
    });
  }
}

extension GameResultQueryWhereDistinct
    on QueryBuilder<GameResult, GameResult, QDistinct> {
  QueryBuilder<GameResult, GameResult, QDistinct> distinctByComment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'comment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByGameTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gameTitle', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByPictureLocalPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pictureLocalPath',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByPictureUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pictureUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByResult(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'result', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByScore1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByScore2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'score2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctBySeatLocation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'seatLocation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByStadium(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stadium', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByTeam1(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'team1', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByTeam1IsMyTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'team1IsMyTeam');
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByTeam2(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'team2', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByTeam2IsMyTeam() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'team2IsMyTeam');
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<GameResult, GameResult, QDistinct> distinctByViewingMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'viewingMode');
    });
  }
}

extension GameResultQueryProperty
    on QueryBuilder<GameResult, GameResult, QQueryProperty> {
  QueryBuilder<GameResult, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GameResult, String?, QQueryOperations> commentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'comment');
    });
  }

  QueryBuilder<GameResult, DateTime?, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<GameResult, DateTime?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<GameResult, String?, QQueryOperations> gameTitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gameTitle');
    });
  }

  QueryBuilder<GameResult, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<GameResult, String?, QQueryOperations>
      pictureLocalPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pictureLocalPath');
    });
  }

  QueryBuilder<GameResult, String?, QQueryOperations> pictureUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pictureUrl');
    });
  }

  QueryBuilder<GameResult, GameResultType?, QQueryOperations> resultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'result');
    });
  }

  QueryBuilder<GameResult, String?, QQueryOperations> score1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score1');
    });
  }

  QueryBuilder<GameResult, String?, QQueryOperations> score2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'score2');
    });
  }

  QueryBuilder<GameResult, String?, QQueryOperations> seatLocationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'seatLocation');
    });
  }

  QueryBuilder<GameResult, String?, QQueryOperations> stadiumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stadium');
    });
  }

  QueryBuilder<GameResult, String?, QQueryOperations> team1Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'team1');
    });
  }

  QueryBuilder<GameResult, bool, QQueryOperations> team1IsMyTeamProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'team1IsMyTeam');
    });
  }

  QueryBuilder<GameResult, String?, QQueryOperations> team2Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'team2');
    });
  }

  QueryBuilder<GameResult, bool, QQueryOperations> team2IsMyTeamProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'team2IsMyTeam');
    });
  }

  QueryBuilder<GameResult, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<GameResult, bool, QQueryOperations> viewingModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'viewingMode');
    });
  }
}
