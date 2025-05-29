part of 'my_account_cubit.dart';

class MyAccountState extends Equatable {
  final CustomizedRoute route;
  final XFile? image;
  @override
  List<Object?> get props => [
        route,
        image,
      ];

  const MyAccountState({
    required this.route,
    required this.image,
  });

  MyAccountState copyWith({
    CustomizedRoute? route,
    XFile? image,

  }) {
    return MyAccountState(
      route: route ?? this.route,
      image: image ?? this.image,
    );
  }
}
