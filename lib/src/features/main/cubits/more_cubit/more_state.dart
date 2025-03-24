part of 'more_cubit.dart';

class MoreState extends Equatable {
  final bool isLocalAuthEnabled;
  final bool isDarkThemeEnabled;
  @override
  List<Object?> get props => [
        isLocalAuthEnabled,
        isDarkThemeEnabled,
      ];

  const MoreState({
    required this.isLocalAuthEnabled,
    required this.isDarkThemeEnabled,
  });

  MoreState copyWith({
    bool? isLocalAuthEnabled,
    bool? isDarkThemeEnabled,
  }) {
    return MoreState(
      isLocalAuthEnabled: isLocalAuthEnabled ?? this.isLocalAuthEnabled,
      isDarkThemeEnabled: isDarkThemeEnabled ?? this.isDarkThemeEnabled,
    );
  }
}
