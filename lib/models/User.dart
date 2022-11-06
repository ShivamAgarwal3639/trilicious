/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _name;
  final String? _number;
  final String? _email;
  final String? _dob;
  final TemporalDateTime? _date;
  final bool? _block;
  final String? _avatar;
  final double? _long;
  final double? _lat;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get name {
    return _name;
  }
  
  String? get number {
    return _number;
  }
  
  String? get email {
    return _email;
  }
  
  String? get dob {
    return _dob;
  }
  
  TemporalDateTime? get date {
    return _date;
  }
  
  bool? get block {
    return _block;
  }
  
  String? get avatar {
    return _avatar;
  }
  
  double? get long {
    return _long;
  }
  
  double? get lat {
    return _lat;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const User._internal({required this.id, name, number, email, dob, date, block, avatar, long, lat, createdAt, updatedAt}): _name = name, _number = number, _email = email, _dob = dob, _date = date, _block = block, _avatar = avatar, _long = long, _lat = lat, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory User({String? id, String? name, String? number, String? email, String? dob, TemporalDateTime? date, bool? block, String? avatar, double? long, double? lat}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      number: number,
      email: email,
      dob: dob,
      date: date,
      block: block,
      avatar: avatar,
      long: long,
      lat: lat);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _name == other._name &&
      _number == other._number &&
      _email == other._email &&
      _dob == other._dob &&
      _date == other._date &&
      _block == other._block &&
      _avatar == other._avatar &&
      _long == other._long &&
      _lat == other._lat;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("number=" + "$_number" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("dob=" + "$_dob" + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("block=" + (_block != null ? _block!.toString() : "null") + ", ");
    buffer.write("avatar=" + "$_avatar" + ", ");
    buffer.write("long=" + (_long != null ? _long!.toString() : "null") + ", ");
    buffer.write("lat=" + (_lat != null ? _lat!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? name, String? number, String? email, String? dob, TemporalDateTime? date, bool? block, String? avatar, double? long, double? lat}) {
    return User._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      email: email ?? this.email,
      dob: dob ?? this.dob,
      date: date ?? this.date,
      block: block ?? this.block,
      avatar: avatar ?? this.avatar,
      long: long ?? this.long,
      lat: lat ?? this.lat);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _number = json['number'],
      _email = json['email'],
      _dob = json['dob'],
      _date = json['date'] != null ? TemporalDateTime.fromString(json['date']) : null,
      _block = json['block'],
      _avatar = json['avatar'],
      _long = (json['long'] as num?)?.toDouble(),
      _lat = (json['lat'] as num?)?.toDouble(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'number': _number, 'email': _email, 'dob': _dob, 'date': _date?.format(), 'block': _block, 'avatar': _avatar, 'long': _long, 'lat': _lat, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'name': _name, 'number': _number, 'email': _email, 'dob': _dob, 'date': _date, 'block': _block, 'avatar': _avatar, 'long': _long, 'lat': _lat, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField NUMBER = QueryField(fieldName: "number");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField DOB = QueryField(fieldName: "dob");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField BLOCK = QueryField(fieldName: "block");
  static final QueryField AVATAR = QueryField(fieldName: "avatar");
  static final QueryField LONG = QueryField(fieldName: "long");
  static final QueryField LAT = QueryField(fieldName: "lat");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.NUMBER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.DOB,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.DATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.BLOCK,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.AVATAR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.LONG,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.LAT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.double)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}