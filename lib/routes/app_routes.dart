import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';

import 'package:newsee/AppData/app_route_constants.dart';
import 'package:newsee/AppSamples/ReactiveForms/view/login-with-account.dart';
import 'package:newsee/AppSamples/ReactiveForms/view/loginpage_view.dart';
import 'package:newsee/AppSamples/ToolBarWidget/view/toolbar_view.dart';
import 'package:newsee/Model/login_request.dart';
import 'package:newsee/blocs/login/login_bloc.dart';
import 'package:newsee/core/api/api_client.dart';

import 'package:newsee/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:newsee/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:newsee/feature/auth/domain/repository/auth_repository.dart';
import 'package:newsee/feature/auth/presentation/bloc/auth_bloc.dart';

import 'package:newsee/feature/masters/data/repository/master_repo_impl.dart';
import 'package:newsee/feature/masters/domain/repository/master_repo.dart';
import 'package:newsee/feature/masters/presentation/bloc/masters_bloc.dart';
import 'package:newsee/feature/masters/presentation/page/masters_page.dart';

import 'package:newsee/feature/cif/data/datasource/chif_remote_datasource.dart';
import 'package:newsee/feature/cif/data/repository/chif_repository_impl.dart';
import 'package:newsee/feature/cif/domain/repository/chif_repository.dart';
import 'package:newsee/feature/cif/presentation/bloc/chif_bloc.dart';

import 'package:newsee/feature/savelead/presentation/bloc/savelead_sourcing_bloc.dart';
import 'package:newsee/pages/cif_pulling.dart';
import 'package:newsee/pages/home_page.dart';
import 'package:newsee/pages/newlead_page.dart';
import 'package:newsee/pages/not_found_error.page.dart';

// ✅ Auth dependencies
final AuthRemoteDatasource _authRemoteDatasource = AuthRemoteDatasource(
  dio: ApiClient().getDio(),
);
final AuthRepository = AuthRepositoryImpl(
  authRemoteDatasource: _authRemoteDatasource,
);

final Dio _dio = ApiClient().getDio();
final ChifRemoteDatasource _chifRemoteDatasource = ChifRemoteDatasource(
  dio: _dio,
);
final ChifRepository _chifRepository = ChifRepositoryImpl(
  chifRemoteDatasource: _chifRemoteDatasource,
);

final routes = GoRouter(
  // initial location
  initialLocation: AppRouteConstants.LOGIN_PAGE['path']!,
  routes: <RouteBase>[
    GoRoute(
      path: AppRouteConstants.LOGIN_PAGE['path']!,
      name: AppRouteConstants.LOGIN_PAGE['name'],
      builder:
          (context, state) => Scaffold(
            body: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (_) => AuthBloc(authRepository: AuthRepository),
                ),
                BlocProvider(
                  create: (_) => ChifBloc(chifRepository: _chifRepository),
                ),
              ],
              child: const CifSearchPage(),
            ),
          ),
    ),
    GoRoute(
      path: AppRouteConstants.HOME_PAGE['path']!,
      name: AppRouteConstants.HOME_PAGE['name'],
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: AppRouteConstants.NEWLEAD_PAGE['path']!,
      name: AppRouteConstants.NEWLEAD_PAGE['name'],
      builder: (context, state) => NewLeadPage(),
    ),
    GoRoute(
      path: AppRouteConstants.MASTERS_PAGE['path']!,
      name: AppRouteConstants.MASTERS_PAGE['name'],
      builder: (context, state) => MastersPage(),
    ),
  ],
  redirect: (context, state) {
    print(state.fullPath);
    if (state.fullPath == '/') {
      return AppRouteConstants.MASTERS_PAGE['path'];
    } else {
      return null;
    }
  },
  errorBuilder: (context, state) => NotFoundErrorPage(),
);
