// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInForm _$SignInFormFromJson(Map<String, dynamic> json) {
  return SignInForm()
    ..email = json['email'] as String
    ..password = json['password'] as String;
}

Map<String, dynamic> _$SignInFormToJson(SignInForm instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
