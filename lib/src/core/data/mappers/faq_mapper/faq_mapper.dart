import 'package:vaultiq/src/core/data/mappers/base_mapper.dart';
import 'package:vaultiq/src/core/domain/entities/faq_model/faq_model.dart';

final class FAQMapper implements BaseMapper<FAQModel> {
  @override
  Map<String, dynamic> toJson(FAQModel data) {
    throw UnimplementedError();
  }

  @override
  FAQModel fromJson(Map<String, dynamic> json) {
    return FAQModel(
      languageCode: json[_Fields.languageCode],
      question: json[_Fields.question],
      answer: json[_Fields.answer],
      orderNumber: json[_Fields.orderNumber],
    );
  }
}

abstract final class _Fields {
  static const String languageCode = 'language_code';
  static const String question = 'question';
  static const String answer = 'answer';
  static const String orderNumber = 'order_number';
}
