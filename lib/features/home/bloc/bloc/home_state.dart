part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeSetCurrentPageState extends HomeState {
  final int currentIndex;

  const HomeSetCurrentPageState(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}

class AppForceUpdate extends HomeState {}

class HomeLoading extends HomeState {}

class ShowUserAgreement extends HomeState {
  final UserAgreementResponseModel userAgreementResponseModel;

  const ShowUserAgreement({required this.userAgreementResponseModel});
}
