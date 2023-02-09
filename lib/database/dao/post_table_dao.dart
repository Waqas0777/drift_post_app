import 'dart:developer';
import 'package:drift/drift.dart';
import 'package:drift_post_app/database/tables/user_registration_table.dart';
import '../app_database.dart';
import '../tables/post_table.dart';

part 'post_table_dao.g.dart';

@DriftAccessor(tables: [PostTable, UserRegistrationTable])
class PostTableDao extends DatabaseAccessor<AppDatabase>
    with _$PostTableDaoMixin {
  final AppDatabase db;

  PostTableDao(this.db) : super(db);

  //Stream<List<PostTableData>> get getPosts => select(postTable).watch();

  Future<int> addPost(PostTableCompanion entry) {
    return into(postTable).insert(entry);
  }

  //Get a single employee
  Future<PostTableData> getPost(int id) async {
    return await (select(postTable)..where((tbl) => tbl.postId.equals(id)))
        .getSingle();
  }

  Stream<List<PostTableData>> getAllPostsByEmailAddress(email) {
    log(email, name: "emaill");
    return (select(postTable)..where((tbl) => tbl.userEmail.equals(email)))
        .watch();
  }

//update
  Future updatePost(PostTableCompanion post) => update(postTable).replace(post);

  //delete a post
  Future<int> deletePost(int id) async {
    return await (delete(postTable)..where((tbl) => tbl.postId.equals(id)))
        .go();
  }

//you can also write the delete query like below

//Future deletePost(PostTableCompanion post) => delete(postTable).delete(post);
}
