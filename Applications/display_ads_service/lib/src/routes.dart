import 'package:angular_router/angular_router.dart';

import 'components/display_ads/display_ads_component.template.dart' as display_ads_template;
import 'components/setup/setup_component.template.dart' as setup_template;

import 'route_paths.dart';

class Routes {
  static final displayAds = RouteDefinition(
    routePath: RoutePaths.displayAds,
    component: display_ads_template.DisplayAdsComponentNgFactory,
    useAsDefault: true,
  );

  static final setup = RouteDefinition(
    routePath: RoutePaths.setup,
    component: setup_template.SetupComponentNgFactory,
  );

  static final setupWithId = RouteDefinition(
    routePath: RoutePaths.setupWithId,
    component: setup_template.SetupComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    displayAds,
    setup,
    setupWithId,
  ];
}