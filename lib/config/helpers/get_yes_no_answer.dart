import 'package:yes_no_flutter_app/domain/entities/message.dart';

import 'package:dio/dio.dart';
import 'package:yes_no_flutter_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    return YesNoModel.fromJson(response.data).toMessageEntity();
  }
}