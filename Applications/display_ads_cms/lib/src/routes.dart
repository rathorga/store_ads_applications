import 'package:angular_router/angular_router.dart';

import 'components/cms/cms_component.template.dart' as cms_template;

import 'route_paths.dart';

class Routes {
    static final displayAdsCms = RouteDefinition(
    routePath: RoutePaths.displayAdsCms,
    component: cms_template.AdminComponentNgFactory,
    useAsDefault: true,
  );

  static final all = <RouteDefinition>[
    displayAdsCms,
  ];
}