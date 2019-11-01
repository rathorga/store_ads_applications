import 'package:angular/angular.dart';

import 'package:angular_app/src/route_paths.dart';

import 'package:angular_components/app_layout/material_persistent_drawer.dart';
import 'package:angular_components/app_layout/material_temporary_drawer.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';
import 'package:angular_components/material_list/material_list.dart';
import 'package:angular_components/material_list/material_list_item.dart';
import 'package:angular_components/material_input/material_input.dart';

import 'package:angular_forms/angular_forms.dart';

import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'cms',
  templateUrl: 'cms.html',
  styleUrls: [
    "cms.css",
    'package:angular_components/app_layout/layout.scss.css',
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
  ],
  directives: [
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialTemporaryDrawerComponent,
    MaterialToggleComponent,
    MaterialListComponent,
    MaterialListItemComponent,
    materialInputDirectives,
    routerDirectives,
    coreDirectives,
    formDirectives
  ],
  exports: [RoutePaths],
)
class AdminComponent {
  // Copied from angular starter app. Removing them breaks the app.
  // These should be removed after the required changes to the view so that the
  // app does not break.
  bool customWidth = false;
  bool end = false;
  bool overlay = false;
  // Define form and control names.
  Form heroForm;
  String storeName;
  String locationName;
  String city;
  // Initialize controls.
  Control storeControl = Control('');
  Control locationControl = Control('');
  Control cityControl = Control('');

  onSubmit () {
    print(heroForm);
  }
}

