// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskListState _$_$_TaskListStateFromJson(Map<String, dynamic> json) {
  return _$_TaskListState(
    tasks: (json['tasks'] as List)
        ?.map(
            (e) => e == null ? null : Task.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalCount: json['totalCount'] as int ?? 0,
    page: json['page'] as int ?? 1,
    perPage: json['perPage'] as int ?? 10,
    maxPage: json['maxPage'] as int ?? 1,
    isLastFetched: json['isLastFetched'] as bool ?? true,
    isFetching: json['isFetching'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_TaskListStateToJson(_$_TaskListState instance) =>
    <String, dynamic>{
      'tasks': instance.tasks,
      'totalCount': instance.totalCount,
      'page': instance.page,
      'perPage': instance.perPage,
      'maxPage': instance.maxPage,
      'isLastFetched': instance.isLastFetched,
      'isFetching': instance.isFetching,
    };
