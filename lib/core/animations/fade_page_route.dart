import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FadeRoute extends PageRouteBuilder<Widget> {
  FadeRoute({
    required this.page,
    Duration? transitionDuration,
    RouteSettings? routeSettings,
  }) : super(
          settings: routeSettings,
          transitionDuration:
              transitionDuration ?? const Duration(milliseconds: 200),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(1, 0),
                ).animate(secondaryAnimation),
                child: child,
              ),
            );
          },
        );

  final Widget page;
}
