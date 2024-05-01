// ignore_for_file: annotate_overrides, overridden_fields
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'colors.dart';

class CustomPlutoGridConfiguration extends PlutoGridConfiguration {
  final bool autoSize;
  CustomPlutoGridConfiguration({this.autoSize = true})
      : super(
          columnSize: PlutoGridColumnSizeConfig(autoSizeMode: autoSize ? PlutoAutoSizeMode.scale : PlutoAutoSizeMode.none),
          style: const PlutoGridStyleConfig(
            gridBorderRadius: BorderRadius.all(Radius.circular(8)),
            enableGridBorderShadow: true,
            gridBackgroundColor: secondaryColor,
            rowColor: secondaryColor,
          ),
        );

  void onLoaded(PlutoGridOnLoadedEvent event) {
    event.stateManager.setShowColumnFilter(false);
  }
}

class CustomPlutoColumn extends PlutoColumn {
  final String title;
  final String field;

  CustomPlutoColumn({
    required this.title,
    required this.field,
  }) : super(
          title: title,
          field: field,
          width: PlutoGridSettings.columnWidth,
          type: PlutoColumnType.text(),
        );
}
