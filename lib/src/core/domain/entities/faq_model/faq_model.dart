import 'package:vaultiq/src/core/domain/entities/domain_object.dart';

final class FAQModel extends DomainObject {
  final String languageCode;
  final String question;
  final String answer;
  final int orderNumber;

  @override
  List<Object> get props => [
    languageCode,
        question,
        answer,
        orderNumber,
      ];

  const FAQModel({
    required this.languageCode,
    required this.question,
    required this.answer,
    required this.orderNumber,
  });

  @override
  FAQModel copyWith() {
    return FAQModel(
      languageCode: languageCode,
      question: question,
      answer: answer,
      orderNumber: orderNumber,
    );
  }
}
