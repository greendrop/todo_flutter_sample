import 'package:openapi/api.dart';
import 'package:test/test.dart';


/// tests for TasksApi
void main() {
  var instance = TasksApi();

  group('tests for TasksApi', () {
    // タスク一覧を取得
    //
    //Future<InlineResponse200> apiV1TasksGet({ num page, num perPage }) async 
    test('test apiV1TasksGet', () async {
      // TODO
    });

    // タスクを削除
    //
    //Future apiV1TasksIdDelete(num id) async 
    test('test apiV1TasksIdDelete', () async {
      // TODO
    });

    // タスクを取得
    //
    //Future<TaskSchema> apiV1TasksIdGet(num id) async 
    test('test apiV1TasksIdGet', () async {
      // TODO
    });

    // タスクを更新
    //
    //Future apiV1TasksIdPatch(num id, { TaskUpdateSchema taskUpdateSchema }) async 
    test('test apiV1TasksIdPatch', () async {
      // TODO
    });

    // タスクを登録
    //
    //Future apiV1TasksPost({ TaskCreateSchema taskCreateSchema }) async 
    test('test apiV1TasksPost', () async {
      // TODO
    });

  });
}
