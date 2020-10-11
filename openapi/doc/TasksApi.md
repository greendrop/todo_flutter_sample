# openapi.api.TasksApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1TasksGet**](TasksApi.md#apiV1TasksGet) | **GET** /api/v1/tasks | タスク一覧を取得
[**apiV1TasksIdDelete**](TasksApi.md#apiV1TasksIdDelete) | **DELETE** /api/v1/tasks/{id} | タスクを削除
[**apiV1TasksIdGet**](TasksApi.md#apiV1TasksIdGet) | **GET** /api/v1/tasks/{id} | タスクを取得
[**apiV1TasksIdPatch**](TasksApi.md#apiV1TasksIdPatch) | **PATCH** /api/v1/tasks/{id} | タスクを更新
[**apiV1TasksPost**](TasksApi.md#apiV1TasksPost) | **POST** /api/v1/tasks | タスクを登録


# **apiV1TasksGet**
> InlineResponse200 apiV1TasksGet(page, perPage)

タスク一覧を取得

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = TasksApi();
var page = 8.14; // num | 
var perPage = 8.14; // num | 

try { 
    var result = api_instance.apiV1TasksGet(page, perPage);
    print(result);
} catch (e) {
    print("Exception when calling TasksApi->apiV1TasksGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **num**|  | [optional] [default to null]
 **perPage** | **num**|  | [optional] [default to null]

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1TasksIdDelete**
> apiV1TasksIdDelete(id)

タスクを削除

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = TasksApi();
var id = 8.14; // num | 

try { 
    api_instance.apiV1TasksIdDelete(id);
} catch (e) {
    print("Exception when calling TasksApi->apiV1TasksIdDelete: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **num**|  | [default to null]

### Return type

void (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1TasksIdGet**
> TaskSchema apiV1TasksIdGet(id)

タスクを取得

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = TasksApi();
var id = 8.14; // num | 

try { 
    var result = api_instance.apiV1TasksIdGet(id);
    print(result);
} catch (e) {
    print("Exception when calling TasksApi->apiV1TasksIdGet: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **num**|  | [default to null]

### Return type

[**TaskSchema**](TaskSchema.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1TasksIdPatch**
> apiV1TasksIdPatch(id, taskUpdateSchema)

タスクを更新

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = TasksApi();
var id = 8.14; // num | 
var taskUpdateSchema = TaskUpdateSchema(); // TaskUpdateSchema | 

try { 
    api_instance.apiV1TasksIdPatch(id, taskUpdateSchema);
} catch (e) {
    print("Exception when calling TasksApi->apiV1TasksIdPatch: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **num**|  | [default to null]
 **taskUpdateSchema** | [**TaskUpdateSchema**](TaskUpdateSchema.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1TasksPost**
> apiV1TasksPost(taskCreateSchema)

タスクを登録

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = TasksApi();
var taskCreateSchema = TaskCreateSchema(); // TaskCreateSchema | 

try { 
    api_instance.apiV1TasksPost(taskCreateSchema);
} catch (e) {
    print("Exception when calling TasksApi->apiV1TasksPost: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **taskCreateSchema** | [**TaskCreateSchema**](TaskCreateSchema.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

