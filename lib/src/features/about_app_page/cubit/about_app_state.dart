part of 'about_app_cubit.dart';

class AboutAppState extends Equatable {
  final CustomizedRoute route;

  @override
  List<Object?> get props => [
        route,
      ];

  const AboutAppState({
    required this.route,
  });

  AboutAppState copyWith({
    CustomizedRoute? route,
  }) {
    return AboutAppState(
      route: route ?? this.route,
    );
  }
}
