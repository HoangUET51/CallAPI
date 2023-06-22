import 'package:dio_flutter/generated/json/base/json_field.dart';
import 'package:dio_flutter/generated/json/post_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PostEntity {
	 int? userId;
	 int? id;
	 String? title;
	 String? body;

	PostEntity({this.userId, this.id, this.title, this.body});

	factory PostEntity.fromJson(Map<String, dynamic> json) => $PostEntityFromJson(json);

	Map<String, dynamic> toJson() => $PostEntityToJson(this);

	PostEntity copyWith({int? userId, int? id, String? title, String? body}) {
		return PostEntity()
			..userId= userId ?? this.userId
			..id= id ?? this.id
			..title= title ?? this.title
			..body= body ?? this.body;
	}

	@override
	String toString() {
		return jsonEncode(this);
	}
}