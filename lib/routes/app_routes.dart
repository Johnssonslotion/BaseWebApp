import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:toilet_app/middleware/auth_middleware.dart';
import 'package:toilet_app/modules/Root/Root_bindings.dart';
import 'package:toilet_app/modules/Root/Root_page.dart';
import 'package:toilet_app/modules/board/board_bindings.dart';
import 'package:toilet_app/modules/board/board_page.dart';
import 'package:toilet_app/modules/detail/detail_bindings.dart';
import 'package:toilet_app/modules/detail/detail_page.dart';
import 'package:toilet_app/modules/front/front_bindings.dart';
import 'package:toilet_app/modules/front/front_page.dart';
import 'package:toilet_app/modules/home/home_bindings.dart';
import 'package:toilet_app/modules/home/home_page.dart';
import 'package:toilet_app/modules/map/map_bindings.dart';
import 'package:toilet_app/modules/map/map_page.dart';
import 'package:toilet_app/modules/member/member_bindings.dart';
import 'package:toilet_app/modules/member/member_page.dart';

abstract class Routes {
  /// 경로 조합 요소
  static const ROOT = _Paths.ROOT; //

  static const HOME = _Paths.HOME;
  static const FRONT = _Paths.HOME + _Paths.FRONT; //Nasted
  static const MAP = _Paths.HOME + _Paths.MAP; //Nasted
  static const BOARD = _Paths.HOME + _Paths.BOARD; //Nasted

  static const SIGNIN = _Paths.SIGNIN;
  static const SIGNUP = _Paths.SIGNUP;
  static const FORGOT = _Paths.FORGOT;
  static const SETTING = _Paths.SETTING;

  Routes._();
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$SIGNIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';

  static String MAP_DETAILS(String toiletID) => '$MAP/$toiletID';
}

abstract class _Paths {
  /// 단일 요소
  static const ROOT = '/';
  static const HOME = '/HOME';
  static const FRONT = '/FRONT';
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
  static const FORGOT = '/forgot';
  static const BOARD = '/board';
  static const MAP = '/map';
  static const DETAILS = '/:toiletId';
  static const SETTING = '/setting';
}

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    //추후 routes.dart로 refactoring
    GetPage(
        name: _Paths.ROOT,
        page: () => RootPage(),
        binding: RootBindings(),
        participatesInRootNavigator: true,
        preventDuplicates: true,
        children: [
          GetPage(
              middlewares: [
                //only enter this route when not authed
                EnsureNotAuthedMiddleware(),
              ],
              preventDuplicates: true,
              name: _Paths.HOME,
              page: () => HomePage(),
              binding: HomeBindings(),
              children: [
                GetPage(
                  name: _Paths.BOARD,
                  page: () => BoardPage(),
                  binding: BoardBindings(),
                ),
                GetPage(
                    name: _Paths.FRONT,
                    page: () => FrontPage(),
                    binding: FrontBindings()),
                GetPage(
                    name: _Paths.MAP,
                    page: () => MapPage(),
                    binding: MapBindings(),
                    children: [
                      GetPage(
                        name: _Paths.DETAILS,
                        page: () => DetailPage(),
                        binding: DetailBindings(),
                      )
                    ])
              ]),
          GetPage(
              preventDuplicates: true,
              name: _Paths.SIGNUP,
              page: () => SignInPage(),
              binding: MemberBindings(),
              children: [
                GetPage(
                  name: _Paths.FORGOT,
                  page: () => ForgotPage(),
                  binding: MemberBindings(),
                ),
              ]),
          GetPage(
            middlewares: [
              EnsureNotAuthedMiddleware(),
            ],
            preventDuplicates: true,
            name: _Paths.SIGNIN,
            page: () => SignUpPage(),
            binding: MemberBindings(),
          ),
          GetPage(
              name: _Paths.MAP,
              page: () => MapPage(),
              binding: MapBindings(),
              children: [])
        ]),
  ];
}
