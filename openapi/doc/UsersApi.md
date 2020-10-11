# openapi.api.UsersApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:3000*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1MeGet**](UsersApi.md#apiV1MeGet) | **GET** /api/v1/me | ログインユーザー情報を取得


# **apiV1MeGet**
> UserSchema apiV1MeGet()

ログインユーザー情報を取得

### Example 
```dart
import 'package:openapi/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//defaultApiClient.getAuthentication<OAuth>('oauth2').accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = UsersApi();

try { 
    var result = api_instance.apiV1MeGet();
    print(result);
} catch (e) {
    print("Exception when calling UsersApi->apiV1MeGet: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserSchema**](UserSchema.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

