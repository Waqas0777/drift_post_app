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
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
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
  Set<GeneratedColumn> get $primaryKey => {id, age};
  @override
  ProfileTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProfileTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
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
  final int age;
  final String? userName;
  final int? phoneNumber;
  final Uint8List? thumbnailImg;
  const ProfileTableData(
      {required this.id,
      required this.age,
      this.userName,
      this.phoneNumber,
      this.thumbnailImg});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['age'] = Variable<int>(age);
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
      age: Value(age),
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
      age: serializer.fromJson<int>(json['age']),
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
      'age': serializer.toJson<int>(age),
      'userName': serializer.toJson<String?>(userName),
      'phoneNumber': serializer.toJson<int?>(phoneNumber),
      'thumbnailImg': serializer.toJson<Uint8List?>(thumbnailImg),
    };
  }

  ProfileTableData copyWith(
          {int? id,
          int? age,
          Value<String?> userName = const Value.absent(),
          Value<int?> phoneNumber = const Value.absent(),
          Value<Uint8List?> thumbnailImg = const Value.absent()}) =>
      ProfileTableData(
        id: id ?? this.id,
        age: age ?? this.age,
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
  final Value<int> age;
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
    required int id,
    required int age,
    this.userName = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.thumbnailImg = const Value.absent(),
  })  : id = Value(id),
        age = Value(age);
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
      Value<int>? age,
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
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _user_emailMeta =
      const VerificationMeta('user_email');
  @override
  late final GeneratedColumn<String> user_email = GeneratedColumn<String>(
      'user_email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _user_passwordMeta =
      const VerificationMeta('user_password');
  @override
  late final GeneratedColumn<String> user_password = GeneratedColumn<String>(
      'user_password', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, user_email, user_password];
  @override
  String get aliasedName => _alias ?? 'users_table';
  @override
  String get actualTableName => 'users_table';
  @override
  VerificationContext validateIntegrity(Insertable<UsersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_email')) {
      context.handle(
          _user_emailMeta,
          user_email.isAcceptableOrUnknown(
              data['user_email']!, _user_emailMeta));
    }
    if (data.containsKey('user_password')) {
      context.handle(
          _user_passwordMeta,
          user_password.isAcceptableOrUnknown(
              data['user_password']!, _user_passwordMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UsersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      user_email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_email']),
      user_password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_password']),
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }
}

class UsersTableData extends DataClass implements Insertable<UsersTableData> {
  final int id;
  final String? user_email;
  final String? user_password;
  const UsersTableData({required this.id, this.user_email, this.user_password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || user_email != null) {
      map['user_email'] = Variable<String>(user_email);
    }
    if (!nullToAbsent || user_password != null) {
      map['user_password'] = Variable<String>(user_password);
    }
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      id: Value(id),
      user_email: user_email == null && nullToAbsent
          ? const Value.absent()
          : Value(user_email),
      user_password: user_password == null && nullToAbsent
          ? const Value.absent()
          : Value(user_password),
    );
  }

  factory UsersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersTableData(
      id: serializer.fromJson<int>(json['id']),
      user_email: serializer.fromJson<String?>(json['user_email']),
      user_password: serializer.fromJson<String?>(json['user_password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'user_email': serializer.toJson<String?>(user_email),
      'user_password': serializer.toJson<String?>(user_password),
    };
  }

  UsersTableData copyWith(
          {int? id,
          Value<String?> user_email = const Value.absent(),
          Value<String?> user_password = const Value.absent()}) =>
      UsersTableData(
        id: id ?? this.id,
        user_email: user_email.present ? user_email.value : this.user_email,
        user_password:
            user_password.present ? user_password.value : this.user_password,
      );
  @override
  String toString() {
    return (StringBuffer('UsersTableData(')
          ..write('id: $id, ')
          ..write('user_email: $user_email, ')
          ..write('user_password: $user_password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, user_email, user_password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersTableData &&
          other.id == this.id &&
          other.user_email == this.user_email &&
          other.user_password == this.user_password);
}

class UsersTableCompanion extends UpdateCompanion<UsersTableData> {
  final Value<int> id;
  final Value<String?> user_email;
  final Value<String?> user_password;
  const UsersTableCompanion({
    this.id = const Value.absent(),
    this.user_email = const Value.absent(),
    this.user_password = const Value.absent(),
  });
  UsersTableCompanion.insert({
    this.id = const Value.absent(),
    this.user_email = const Value.absent(),
    this.user_password = const Value.absent(),
  });
  static Insertable<UsersTableData> custom({
    Expression<int>? id,
    Expression<String>? user_email,
    Expression<String>? user_password,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (user_email != null) 'user_email': user_email,
      if (user_password != null) 'user_password': user_password,
    });
  }

  UsersTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? user_email,
      Value<String?>? user_password}) {
    return UsersTableCompanion(
      id: id ?? this.id,
      user_email: user_email ?? this.user_email,
      user_password: user_password ?? this.user_password,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (user_email.present) {
      map['user_email'] = Variable<String>(user_email.value);
    }
    if (user_password.present) {
      map['user_password'] = Variable<String>(user_password.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('id: $id, ')
          ..write('user_email: $user_email, ')
          ..write('user_password: $user_password')
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
