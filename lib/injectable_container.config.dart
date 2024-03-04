// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:d_demo/core/network/network_info.dart' as _i8;
import 'package:d_demo/feature/api/manager/api_caller.dart' as _i3;
import 'package:d_demo/feature/budgets/data/data_source/budget_data_source.dart'
    as _i4;
import 'package:d_demo/feature/budgets/data/repository/budget_repository_impl.dart'
    as _i11;
import 'package:d_demo/feature/budgets/domain/repository/budget_repository.dart'
    as _i10;
import 'package:d_demo/feature/budgets/domain/use_case/add_new_budget_category.dart'
    as _i13;
import 'package:d_demo/feature/budgets/domain/use_case/get_budget.dart' as _i12;
import 'package:d_demo/feature/budgets/presentation/bloc/budget_bloc.dart'
    as _i14;
import 'package:d_demo/feature/home/presentation/cubit/navigator_controller_cubit.dart'
    as _i7;
import 'package:d_demo/feature/repository_manager/repository_manager.dart'
    as _i9;
import 'package:d_demo/injectable_container.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerHttpClient = _$RegisterHttpClient();
    final registerInternetConnectionChecker =
        _$RegisterInternetConnectionChecker();
    gh.lazySingleton<_i3.ApiCaller>(() => _i3.ApiCallerImpl());
    gh.lazySingleton<_i4.BudgetDataSource>(
        () => _i4.BudgetDataSourceImpl(apiCaller: gh<_i3.ApiCaller>()));
    gh.lazySingleton<_i5.Client>(() => registerHttpClient.client);
    gh.lazySingleton<_i6.InternetConnection>(
        () => registerInternetConnectionChecker.client);
    gh.factory<_i7.NavigatorControllerCubit>(
        () => _i7.NavigatorControllerCubit());
    gh.lazySingleton<_i8.NetworkInfo>(
        () => _i8.NetworkInfoImpl(checker: gh<_i6.InternetConnection>()));
    gh.lazySingleton<_i9.RepositoryHelper>(
        () => _i9.RepositoryHelperImpl(networkInfo: gh<_i8.NetworkInfo>()));
    gh.lazySingleton<_i10.BudgetRepository>(() => _i11.BudgetRepositoryImpl(
          dataSource: gh<_i4.BudgetDataSource>(),
          repositoryHelper: gh<_i9.RepositoryHelper>(),
        ));
    gh.lazySingleton<_i12.GetBudget>(
        () => _i12.GetBudget(repository: gh<_i10.BudgetRepository>()));
    gh.lazySingleton<_i13.AddNewBudgetCategory>(() =>
        _i13.AddNewBudgetCategory(repository: gh<_i10.BudgetRepository>()));
    gh.factory<_i14.BudgetBloc>(() => _i14.BudgetBloc(
          gh<_i13.AddNewBudgetCategory>(),
          gh<_i12.GetBudget>(),
        ));
    return this;
  }
}

class _$RegisterHttpClient extends _i15.RegisterHttpClient {}

class _$RegisterInternetConnectionChecker
    extends _i15.RegisterInternetConnectionChecker {}
