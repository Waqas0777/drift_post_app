// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProfileTableTable extends ProfileTable
    with TableInfo<$ProfileTableTable, ProfileTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProfileTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _userNameMeta =
      const VerificationMeta('userName');
  @override
  late final GeneratedColumn<String> userName = GeneratedColumn<String>(
      'user_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  @override
  late final GeneratedColumn<int> phoneNumber = GeneratedColumn<int>(
      'phone_number', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _thumbnailImgMeta =
      const VerificationMeta('thumbnailImg');
  @override
  late final GeneratedColumn<Uint8List> thumbnailImg =
      GeneratedColumn<Uint8List>('thumbnail_img', aliasedName, true,
          type: DriftSqlType.blob, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, age, userName, phoneNumber, thumbnailImg];
  @override
  String get aliasedName => _alias ?? 'profile_table';
  @override
  String get actualTableName => 'profile_table';
  @override
  VerificationContext validateIntegrity(Insertable<ProfileTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    }
    if (data.containsKey('user_name')) {
      context.handle(_userNameMeta,
          userName.isAcceptableOrUnknown(data['user_name']!, _userNameMeta));
    }
    if (data.containsKey('phone_number')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phone_number']!, _phoneNumberMeta));
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProfileTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age']),
      userName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_name']),
      phoneNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}phone_number']),
      thumbnailImg: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}thumbnail_img']),
    );
  }

  @override
  $ProfileTableTable createAlias(String alias) {
    return $ProfileTableTable(attachedDatabase, alias);
  }
}

class ProfileTableData extends DataClass
    implements Insertable<ProfileTableData> {
  final int id;
  final int? age;
  final String? userName;
  final int? phoneNumber;
  final Uint8List? thumbnailImg;
  const ProfileTableData(
      {required this.id,
      this.age,
      this.userName,
      this.phoneNumber,
      this.thumbnailImg});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || userName != null) {
      map['user_name'] = Variable<String>(userName);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<int>(phoneNumber);
    }
    if (!nullToAbsent || thumbnailImg != null) {
      map['thumbnail_img'] = Variable<Uint8List>(thumbnailImg);
    }
    return map;
  }

  ProfileTableCompanion toCompanion(bool nullToAbsent) {
    return ProfileTableCompanion(
      id: Value(id),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      userName: userName == null && nullToAbsent
          ? const Value.absent()
          : Value(userName),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      thumbnailImg: thumbnailImg == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailImg),
    );
  }

  factory ProfileTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProfileTableData(
      id: serializer.fromJson<int>(json['id']),
      age: serializer.fromJson<int?>(json['age']),
      userName: serializer.fromJson<String?>(json['userName']),
      phoneNumber: serializer.fromJson<int?>(json['phoneNumber']),
      thumbnailImg: serializer.fromJson<Uint8List?>(json['thumbnailImg']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'age': serializer.toJson<int?>(age),
      'userName': serializer.toJson<String?>(userName),
      'phoneNumber': serializer.toJson<int?>(phoneNumber),
      'thumbnailImg': serializer.toJson<Uint8List?>(thumbnailImg),
    };
  }

  ProfileTableData copyWith(
          {int? id,
          Value<int?> age = const Value.absent(),
          Value<String?> userName = const Value.absent(),
          Value<int?> phoneNumber = const Value.absent(),
          Value<Uint8List?> thumbnailImg = const Value.absent()}) =>
      ProfileTableData(
        id: id ?? this.id,
        age: age.present ? age.value : this.age,
        userName: userName.present ? userName.value : this.userName,
        phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
        thumbnailImg:
            thumbnailImg.present ? thumbnailImg.value : this.thumbnailImg,
      );
  @override
  String toString() {
    return (StringBuffer('ProfileTableData(')
          ..write('id: $id, ')
          ..write('age: $age, ')
          ..write('userName: $userName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('thumbnailImg: $thumbnailImg')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, age, userName, phoneNumber, $driftBlobEquality.hash(thumbnailImg));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileTableData &&
          other.id == this.id &&
          other.age == this.age &&
          other.userName == this.userName &&
          other.phoneNumber == this.phoneNumber &&
          $driftBlobEquality.equals(other.thumbnailImg, this.thumbnailImg));
}

class ProfileTableCompanion extends UpdateCompanion<ProfileTableData> {
  final Value<int> id;
  final Value<int?> age;
  final Value<String?> userName;
  final Value<int?> phoneNumber;
  final Value<Uint8List?> thumbnailImg;
  const ProfileTableCompanion({
    this.id = const Value.absent(),
    this.age = const Value.absent(),
    this.userName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.thumbnailImg = const Value.absent(),
  });
  ProfileTableCompanion.insert({
    this.id = const Value.absent(),
    this.age = const Value.absent(),
    this.userName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.thumbnailImg = const Value.absent(),
  });
  static Insertable<ProfileTableData> custom({
    Expression<int>? id,
    Expression<int>? age,
    Expression<String>? userName,
    Expression<int>? phoneNumber,
    Expression<Uint8List>? thumbnailImg,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (age != null) 'age': age,
      if (userName != null) 'user_name': userName,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (thumbnailImg != null) 'thumbnail_img': thumbnailImg,
    });
  }

  ProfileTableCompanion copyWith(
      {Value<int>? id,
      Value<int?>? age,
      Value<String?>? userName,
      Value<int?>? phoneNumber,
      Value<Uint8List?>? thumbnailImg}) {
    return ProfileTableCompanion(
      id: id ?? this.id,
      age: age ?? this.age,
      userName: userName ?? this.userName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      thumbnailImg: thumbnailImg ?? this.thumbnailImg,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (userName.present) {
      map['user_name'] = Variable<String>(userName.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<int>(phoneNumber.value);
    }
    if (thumbnailImg.present) {
      map['thumbnail_img'] = Variable<Uint8List>(thumbnailImg.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileTableCompanion(')
          ..write('id: $id, ')
          ..write('age: $age, ')
          ..write('userName: $userName, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('thumbnailImg: $thumbnailImg')
          ..write(')'))
        .toString();
  }
}

class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, UsersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userEmailMeta =
      const VerificationMeta('userEmail');
  @override
  late final GeneratedColumn<String> userEmail = GeneratedColumn<String>(
      'user_email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userPasswordMeta =
      const VerificationMeta('userPassword');
  @override
  late final GeneratedColumn<String> userPassword = GeneratedColumn<String>(
      'user_password', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [userId, userEmail, userPassword];
  @override
  String get aliasedName => _alias ?? 'users_table';
  @override
  String get actualTableName => 'users_table';
  @override
  VerificationContext validateIntegrity(Insertable<UsersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    }
    if (data.containsKey('user_email')) {
      context.handle(_userEmailMeta,
          userEmail.isAcceptableOrUnknown(data['user_email']!, _userEmailMeta));
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
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UsersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersTableData(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      userEmail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_email']),
      userPassword: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_password']),
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }
}

class UsersTableData extends DataClass implements Insertable<UsersTableData> {
  final int userId;
  final String? userEmail;
  final String? userPassword;
  const UsersTableData(
      {required this.userId, this.userEmail, this.userPassword});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || userEmail != null) {
      map['user_email'] = Variable<String>(userEmail);
    }
    if (!nullToAbsent || userPassword != null) {
      map['user_password'] = Variable<String>(userPassword);
    }
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      userId: Value(userId),
      userEmail: userEmail == null && nullToAbsent
          ? const Value.absent()
          : Value(userEmail),
      userPassword: userPassword == null && nullToAbsent
          ? const Value.absent()
          : Value(userPassword),
    );
  }

  factory UsersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersTableData(
      userId: serializer.fromJson<int>(json['userId']),
      userEmail: serializer.fromJson<String?>(json['userEmail']),
      userPassword: serializer.fromJson<String?>(json['userPassword']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'userEmail': serializer.toJson<String?>(userEmail),
      'userPassword': serializer.toJson<String?>(userPassword),
    };
  }

  UsersTableData copyWith(
          {int? userId,
          Value<String?> userEmail = const Value.absent(),
          Value<String?> userPassword = const Value.absent()}) =>
      UsersTableData(
        userId: userId ?? this.userId,
        userEmail: userEmail.present ? userEmail.value : this.userEmail,
        userPassword:
            userPassword.present ? userPassword.value : this.userPassword,
      );
  @override
  String toString() {
    return (StringBuffer('UsersTableData(')
          ..write('userId: $userId, ')
          ..write('userEmail: $userEmail, ')
          ..write('userPassword: $userPassword')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, userEmail, userPassword);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersTableData &&
          other.userId == this.userId &&
          other.userEmail == this.userEmail &&
          other.userPassword == this.userPassword);
}

class UsersTableCompanion extends UpdateCompanion<UsersTableData> {
  final Value<int> userId;
  final Value<String?> userEmail;
  final Value<String?> userPassword;
  const UsersTableCompanion({
    this.userId = const Value.absent(),
    this.userEmail = const Value.absent(),
    this.userPassword = const Value.absent(),
  });
  UsersTableCompanion.insert({
    this.userId = const Value.absent(),
    this.userEmail = const Value.absent(),
    this.userPassword = const Value.absent(),
  });
  static Insertable<UsersTableData> custom({
    Expression<int>? userId,
    Expression<String>? userEmail,
    Expression<String>? userPassword,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (userEmail != null) 'user_email': userEmail,
      if (userPassword != null) 'user_password': userPassword,
    });
  }

  UsersTableCompanion copyWith(
      {Value<int>? userId,
      Value<String?>? userEmail,
      Value<String?>? userPassword}) {
    return UsersTableCompanion(
      userId: userId ?? this.userId,
      userEmail: userEmail ?? this.userEmail,
      userPassword: userPassword ?? this.userPassword,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
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
    return (StringBuffer('UsersTableCompanion(')
          ..write('userId: $userId, ')
          ..write('userEmail: $userEmail, ')
          ..write('userPassword: $userPassword')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ProfileTableTable profileTable = $ProfileTableTable(this);
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final UsersTableDao usersTableDao = UsersTableDao(this as AppDatabase);
  late final ProfileTableDao profileTableDao =
      ProfileTableDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [profileTable, usersTable];
}
