import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/models/app_model.dart';
import 'package:portfolio/views/apps/app_detail/privacy_policy/privacy_policy_view.dart';
import 'package:portfolio/views/apps/app_detail/terms_of_service/terms_of_service.dart';
import 'package:portfolio/views/apps/apps_view.dart';
import 'package:portfolio/views/apps/app_detail/app_detail_view.dart';
import 'package:portfolio/views/career/career_view.dart';
import 'package:portfolio/views/error/error_view.dart';
import 'package:portfolio/views/home/home_view.dart';

class NavigationService {
  const NavigationService._();

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return const CupertinoPage(
            child: HomeView(),
          );
        },
      ),
      GoRoute(
        path: '/apps',
        pageBuilder: (context, state) {
          return const CupertinoPage(
            child: AppsView(),
          );
        },
        routes: [
          GoRoute(
            path: ':app_name',
            pageBuilder: (context, state) {
              final name = state.pathParameters['app_name'].toString();

              final app = AppModel.apps.where((app) {
                return app.title.toLowerCase() == name;
              }).toList();

              if (app.isEmpty) {
                return const CupertinoPage(
                  child: ErrorView(),
                );
              }

              return CupertinoPage(
                child: AppDetailView(app: app.first),
              );
            },
            routes: [
              GoRoute(
                path: ':privacy-policy',
                pageBuilder: (context, state) {
                  final name = state.pathParameters['app_name'].toString();
                  final app = AppModel.apps.where((app) {
                    return app.title.toLowerCase() == name;
                  }).toList();

                  if (app.isEmpty) {
                    return const CupertinoPage(
                      child: ErrorView(),
                    );
                  }

                  return CupertinoPage(
                      child: PrivacyPolicyView(app: app.first));
                },
              ),
              GoRoute(
                path: ':terms-of-service',
                pageBuilder: (context, state) {
                  final name = state.pathParameters['app_name'].toString();
                  final app = AppModel.apps.where((app) {
                    return app.title.toLowerCase() == name;
                  }).toList();

                  if (app.isEmpty) {
                    return const CupertinoPage(
                      child: ErrorView(),
                    );
                  }

                  return CupertinoPage(
                    child: TermsOfService(
                      app: app.first,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/career',
        pageBuilder: (context, state) {
          return const CupertinoPage(
            child: CareerView(),
          );
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return const CupertinoPage(
        child: ErrorView(),
      );
    },
    debugLogDiagnostics: true,
  );
}
