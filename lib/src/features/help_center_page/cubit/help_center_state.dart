part of 'help_center_cubit.dart';

class HelpCenterState extends Equatable {
  final CustomizedRoute route;
  final List<FAQModel?> faq;
  @override
  List<Object?> get props => [
        route,
        faq,
      ];

  const HelpCenterState({
    required this.route,
    required this.faq,
  });

  HelpCenterState copyWith({
    CustomizedRoute? route,
    List<FAQModel?>? faq,
  }) {
    return HelpCenterState(
      route: route ?? this.route,
      faq: faq ?? this.faq,
    );
  }
}
