part of 'theme_shared_cubit.dart';

final class ThemeSharedState extends Equatable {
  final ThemeType themeType;

  @override
  List<Object?> get props => [
        themeType,
      ];

  const ThemeSharedState({
    required this.themeType,
  });

  ThemeSharedState copyWith({
    ThemeType? themeType,
  }) {
    return ThemeSharedState(
      themeType: themeType ?? this.themeType,
    );
  }
}
