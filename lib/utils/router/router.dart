// ボトムナビゲーションを非表示にしたいルートパスを指定
import 'package:go_router/go_router.dart';
import 'package:layer_architecture_template/presentation/error/error_page.dart';
import 'package:layer_architecture_template/presentation/home/home_page.dart';
import 'package:layer_architecture_template/presentation/room/room_page.dart';
import 'package:layer_architecture_template/utils/router/app_router.dart';

import '../../presentation/splash/splash_page.dart';

const denyShowBNBList = [
  SplashPage.routePath,
];

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: SplashPage.routePath,
  // URLリクエストエラー時
  errorBuilder: (context, state) {
    return const CommonErrorPage();
  },

  /// ルート定義
  routes: [
    /// 起動動線
    GoRoute(
      name: SplashPage.routeName,
      path: SplashPage.routePath,
      builder: (_, __) => const SplashPage(),
    ),

    /// アプリホーム
    GoRoute(
      name: HomePage.routeName,
      path: HomePage.routePath,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const HomePage(),
      ),
    ),
    // ルーム画面
    GoRoute(
      name: RoomPage.routeName,
      path: RoomPage.routePath,
      pageBuilder: (context, state) {
        // パスパラメータを取得
        final params =
            AppRouter().getQueryParams(url: state.location.toString());
        return NoTransitionPage(
          key: state.pageKey,
          child: RoomPage(roomId: params['roomId']!),
        );
      },
    ),
  ],
);
