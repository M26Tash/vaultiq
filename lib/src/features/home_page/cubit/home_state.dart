part of 'home_cubit.dart';

class HomeState extends Equatable {
  final CustomizedRoute route;
  final Session? currentSession;

  @override
  List<Object?> get props => [
        route,
        currentSession,
      ];

  const HomeState({
    required this.route,
    this.currentSession,
  });

  HomeState copyWith({
    CustomizedRoute? route,
    Session? currentSession,
  }) {
    return HomeState(
      route: route ?? this.route,
      currentSession: currentSession ?? this.currentSession,
    );
  }
}
