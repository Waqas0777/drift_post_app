import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:drift_post_app/database/tables/user_registration_table.dart';
import '../../main.dart';
import '../../model/sharedpreferences_model.dart';
import '../app_database.dart';
import '../tables/post_table.dart';

part 'post_table_dao.g.dart';

@DriftAccessor(tables: [PostTable, UserRegistrationTable])
class PostTableDao extends DatabaseAccessor<AppDatabase>
    with _$PostTableDaoMixin {
  //String emailAd = getIt<SharedPreferencesModel>().getLoginEmail();
  final AppDatabase db;

  PostTableDao(this.db) : super(db);

  //Stream<List<PostTableData>> get getPosts => select(postTable).watch();

  Future<int> addPost(PostTableCompanion entry) {
    return into(postTable).insert(entry);
  }

  Stream<List<PostTableData>> getAllPostsByEmailAddress(em) {
    log(em, name: "emaill");
    return (select(postTable)..where((tbl) => tbl.userEmail.equals(em)))
        .watch();
  }

//Future updatePost(PostTableCompanion post) => update(postTable).replace(post);

//Future deletePost(PostTableCompanion post) => delete(postTable).delete(post);

}
