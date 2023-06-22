import 'package:dio_flutter/generated/json/base/json_convert_content.dart';
import 'package:dio_flutter/post_entity.dart';

PostEntity $PostEntityFromJson(Map<String, dynamic> json) {
	final PostEntity postEntity = PostEntity();
	final int? userId = jsonConvert.convert<int>(json['userId']);
	if (userId != null) {
		postEntity.userId = userId;
	}
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		postEntity.id = id;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		postEntity.title = title;
	}
	final String? body = jsonConvert.convert<String>(json['body']);
	if (body != null) {
		postEntity.body = body;
	}
	return postEntity;
}

Map<String, dynamic> $PostEntityToJson(PostEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['userId'] = entity.userId;
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['body'] = entity.body;
	return data;
}