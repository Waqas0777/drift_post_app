// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PostTableTable extends PostTable
    with TableInfo<$PostTableTable, PostTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PostTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _postIdMeta = const VerificationMeta('postId');
  @override
  late final GeneratedColumn<int> postId = GeneratedColumn<int>(
      'post_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _postNameMeta =
      const VerificationMeta('postName');
  @override
  late final GeneratedColumn<String> postName = GeneratedColumn<String>(
      'post_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _postDescriptionMeta =
      const VerificationMeta('postDescription');
  @override
  late final GeneratedColumn<String> postDescription = GeneratedColumn<String>(
      'post_description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _thumbnailImgMeta =
      const VerificationMeta('thumbnailImg');
  @override
  late final GeneratedColumn<Uint8List> thumbnailImg =
      GeneratedColumn<Uint8List>('thumbnail_img', aliasedName, true,
          type: DriftSqlType.blob, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [postId, postName, postDescription, thumbnailImg];
  @override
  String get aliasedName => _alias ?? 'post_table';
  @override
  String get actualTableName => 'post_table';
  @override
  VerificationContext validateIntegrity(Insertable<PostTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('post_id')) {
      context.handle(_postIdMeta,
          postId.isAcceptableOrUnknown(data['post_id']!, _postIdMeta));
    }
    if (data.containsKey('post_name')) {
      context.handle(_postNameMeta,
          postName.isAcceptableOrUnknown(data['post_name']!, _postNameMeta));
    }
    if (data.containsKey('post_description')) {
      context.handle(
          _postDescriptionMeta,
          postDescription.isAcceptableOrUnknown(
              data['post_description']!, _postDescriptionMeta));
    }
    if (data.containsKey('thumbnail_img')) {
      context.handle(
          _thumbnailImgMeta,
          thumbnailImg.isAcceptableOrUnknown(
              data['thumbnail_img']!, _thumbnailImgMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {postId};
  @override
  PostTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PostTableData(
      postId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}post_id'])!,
      postName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}post_name']),
      postDescription: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}post_description']),
      thumbnailImg: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}thumbnail_img']),
    );
  }

  @override
  $PostTableTable createAlias(String alias) {
    return $PostTableTable(attachedDatabase, alias);
  }
}

class PostTableData extends DataClass implements Insertable<PostTableData> {
  final int postId;
  final String? postName;
  final String? postDescription;
  final Uint8List? thumbnailImg;
  const PostTableData(
      {required this.postId,
      this.postName,
      this.postDescription,
      this.thumbnailImg});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['post_id'] = Variable<int>(postId);
    if (!nullToAbsent || postName != null) {
      map['post_name'] = Variable<String>(postName);
    }
    if (!nullToAbsent || postDescription != null) {
      map['post_description'] = Variable<String>(postDescription);
    }
    if (!nullToAbsent || thumbnailImg != null) {
      map['thumbnail_img'] = Variable<Uint8List>(thumbnailImg);
    }
    return map;
  }

  PostTableCompanion toCompanion(bool nullToAbsent) {
    return PostTableCompanion(
      postId: Value(postId),
      postName: postName == null && nullToAbsent
          ? const Value.absent()
          : Value(postName),
      postDescription: postDescription == null && nullToAbsent
          ? const Value.absent()
          : Value(postDescription),
      thumbnailImg: thumbnailImg == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailImg),
    );
  }

  factory PostTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PostTableData(
      postId: serializer.fromJson<int>(json['postId']),
      postName: serializer.fromJson<String?>(json['postName']),
      postDescription: serializer.fromJson<String?>(json['postDescription']),
      thumbnailImg: serializer.fromJson<Uint8List?>(json['thumbnailImg']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'postId': serializer.toJson<int>(postId),
      'postName': serializer.toJson<String?>(postName),
      'postDescription': serializer.toJson<String?>(postDescription),
      'thumbnailImg': serializer.toJson<Uint8List?>(thumbnailImg),
    };
  }

  PostTableData copyWith(
          {int? postId,
          Value<String?> postName = const Value.absent(),
          Value<String?> postDescription = const Value.absent(),
          Value<Uint8List?> thumbnailImg = const Value.absent()}) =>
      PostTableData(
        postId: postId ?? this.postId,
        postName: postName.present ? postName.value : this.postName,
        postDescription: postDescription.present
            ? postDescription.value
            : this.postDescription,
        thumbnailImg:
            thumbnailImg.present ? thumbnailImg.value : this.thumbnailImg,
      );
  @override
  String toString() {
    return (StringBuffer('PostTableData(')
          ..write('postId: $postId, ')
          ..write('postName: $postName, ')
          ..write('postDescription: $postDescription, ')
          ..write('thumbnailImg: $thumbnailImg')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      postId, postName, postDescription, $driftBlobEquality.hash(thumbnailImg));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PostTableData &&
          other.postId == this.postId &&
          other.postName == this.postName &&
          other.postDescription == this.postDescription &&
          $driftBlobEquality.equals(other.thumbnailImg, this.thumbnailImg));
}

class PostTableCompanion extends UpdateCompanion<PostTableData> {
  final Value<int> postId;
  final Value<String?> postName;
  final Value<String?> postDescription;
  final Value<Uint8List?> thumbnailImg;
  const PostTableCompanion({
    this.postId = const Value.absent(),
    this.postName = const Value.absent(),
    this.postDescription = const Value.absent(),
    this.thumbnailImg = const Value.absent(),
  });
  PostTableCompanion.insert({
    this.postId = const Value.absent(),
    this.postName = const Value.absent(),
    this.postDescription = const Value.absent(),
    this.thumbnailImg = const Value.absent(),
  });
  static Insertable<PostTableData> custom({
    Expression<int>? postId,
    Expression<String>? postName,
    Expression<String>? postDescription,
    Expression<Uint8List>? thumbnailImg,
  }) {
    return RawValuesInsertable({
      if (postId != null) 'post_id': postId,
      if (postName != null) 'post_name': postName,
      if (postDescription != null) 'post_description': postDescription,
      if (thumbnailImg != null) 'thumbnail_img': thumbnailImg,
    });
  }

  PostTableCompanion copyWith(
      {Value<int>? postId,
      Value<String?>? postName,
      Value<String?>? postDescription,
      Value<Uint8List?>? thumbnailImg}) {
    return PostTableCompanion(
      postId: postId ?? this.postId,
      postName: postName ?? this.postName,
      postDescription: postDescription ?? this.postDescription,
      thumbnailImg: thumbnailImg ?? this.thumbnailImg,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (postId.present) {
      map['post_id'] = Variable<int>(postId.value);
    }
    if (postName.present) {
      map['post_name'] = Variable<String>(postName.value);
    }
    if (postDescription.present) {
      map['post_description'] = Variable<String>(postDescription.value);
    }
    if (thumbnailImg.present) {
      map['thumbnail_img'] = Variable<Uint8List>(thumbnailImg.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PostTableCompanion(')
          ..write('postId: $postId, ')
          ..write('postName: $postName, ')
          ..write('postDescription: $postDescription, ')
          ..write('thumbnailImg: $thumbnailImg')
          ..write(')'))
        .toString();
  }
}

class $UserRegistrationTableTable extends UserRegistrationTable
    with TableInfo<$UserRegistrationTableTable, UserRegistrationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserRegistrationTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userEmailMeta =
      const VerificationMeta('userEmail');
  @override
  late final GeneratedColumn<String> userEmail = GeneratedColumn<String>(
      'user_email', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userPasswordMeta =
      const VerificationMeta('userPassword');
  @override
  late final GeneratedColumn<String> userPassword = GeneratedColumn<String>(
      'user_password', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [userName, userEmail, userPassword];
  @override
  String get aliasedName => _alias ?? 'user_registration_table';
  @override
  String get actualTableName => 'user_registration_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<UserRegistrationTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    }
    if (data.containsKey('user_email')) {
      context.handle(_userEmailMeta,
          userEmail.isAcceptableOrUnknown(data['user_email']!, _userEmailMeta));
    } else if (isInserting) {
      context.missing(_userEmailMeta);
    }
    if (data.containsKey('user_password')) {
      context.handle(
          _userPasswordMeta,
          userPassword.isAcceptableOrUnknown(
              data['user_password']!, _userPasswordMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userEmail};
  @override
  UserRegistrationTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserRegistrationTableData(
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name']),
      userEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_email'])!,
      userPassword: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_password']),
    );
  }

  @override
  $UserRegistrationTableTable createAlias(String alias) {
    return $UserRegistrationTableTable(attachedDatabase, alias);
  }
}

class UserRegistrationTableData extends DataClass
    implements Insertable<UserRegistrationTableData> {
  final String? userName;
  final String userEmail;
  final String? userPassword;
  const UserRegistrationTableData(
      {this.userName, required this.userEmail, this.userPassword});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || userName != null) {
      map['user_name'] = Variable<String>(userName);
    }
    map['user_email'] = Variable<String>(userEmail);
    if (!nullToAbsent || userPassword != null) {
      map['user_password'] = Variable<String>(userPassword);
    }
    return map;
  }

  UserRegistrationTableCompanion toCompanion(bool nullToAbsent) {
    return UserRegistrationTableCompanion(
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      userEmail: Value(userEmail),
      userPassword: userPassword == null && nullToAbsent
          ? const Value.absent()
          : Value(userPassword),
    );
  }

  factory UserRegistrationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserRegistrationTableData(
      userName: serializer.fromJson<String?>(json['userName']),
      userEmail: serializer.fromJson<String>(json['userEmail']),
      userPassword: serializer.fromJson<String?>(json['userPassword']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userName': serializer.toJson<String?>(userName),
      'userEmail': serializer.toJson<String>(userEmail),
      'userPassword': serializer.toJson<String?>(userPassword),
    };
  }

  UserRegistrationTableData copyWith(
          {Value<String?> userName = const Value.absent(),
          String? userEmail,
          Value<String?> userPassword = const Value.absent()}) =>
      UserRegistrationTableData(
        userName: userName.present ? userName.value : this.userName,
        userEmail: userEmail ?? this.userEmail,
        userPassword:
            userPassword.present ? userPassword.value : this.userPassword,
      );
  @override
  String toString() {
    return (StringBuffer('UserRegistrationTableData(')
          ..write('userName: $userName, ')
          ..write('userEmail: $userEmail, ')
          ..write('userPassword: $userPassword')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userName, userEmail, userPassword);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserRegistrationTableData &&
          other.userName == this.userName &&
          other.userEmail == this.userEmail &&
          other.userPassword == this.userPassword);
}

class UserRegistrationTableCompanion
    extends UpdateCompanion<UserRegistrationTableData> {
  final Value<String?> userName;
  final Value<String> userEmail;
  final Value<String?> userPassword;
  const UserRegistrationTableCompanion({
    this.userName = const Value.absent(),
    this.userEmail = const Value.absent(),
    this.userPassword = const Value.absent(),
  });
  UserRegistrationTableCompanion.insert({
    this.userName = const Value.absent(),
    required String userEmail,
    this.userPassword = const Value.absent(),
  }) : userEmail = Value(userEmail);
  static Insertable<UserRegistrationTableData> custom({
    Expression<String>? userName,
    Expression<String>? userEmail,
    Expression<String>? userPassword,
  }) {
    return RawValuesInsertable({
      if (userName != null) 'user_name': userName,
      if (userEmail != null) 'user_email': userEmail,
      if (userPassword != null) 'user_password': userPassword,
    });
  }

  UserRegistrationTableCompanion copyWith(
      {Value<String?>? userName,
      Value<String>? userEmail,
      Value<String?>? userPassword}) {
    return UserRegistrationTableCompanion(
      userName: userName ?? this.userName,
      userEmail: userEmail ?? this.userEmail,
      userPassword: userPassword ?? this.userPassword,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (userEmail.present) {
      map['user_email'] = Variable<String>(userEmail.value);
    }
    if (userPassword.present) {
      map['user_password'] = Variable<String>(userPassword.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserRegistrationTableCompanion(')
          ..write('userName: $userName, ')
          ..write('userEmail: $userEmail, ')
          ..write('userPassword: $userPassword')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $PostTableTable postTable = $PostTableTable(this);
  late final $UserRegistrationTableTable userRegistrationTable =
      $UserRegistrationTableTable(this);
  late final UsersTableDao usersTableDao = UsersTableDao(this as AppDatabase);
  late final PostTableDao postTableDao = PostTableDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [postTable, userRegistrationTable];
}
