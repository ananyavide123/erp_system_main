import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../reusables/pluto_column_config.dart';

///Column name and ids
List<String> capactityBuildingColumns = [
  "S/N",
  "Training Description",
  "Start Date",
  "Training Type",
  "Duration",
  "Training Mode",
  "Status",
  "Action",
];
List<String> capactityBuildingColumnIds = capactityBuildingColumns.map((e) => e.replaceAll(" ", "").toLowerCase()).toList();

class CapacityTable extends StatefulWidget {
  const CapacityTable({
    super.key,
  });
  @override
  State<CapacityTable> createState() => _CapacityTableState();
}

class _CapacityTableState extends State<CapacityTable> {
  List<PlutoColumn> cols = [];
  List<PlutoRow> rows = [];

  @override
  void initState() {
    cols = List.generate(
      capactityBuildingColumns.length,
      (index) => CustomPlutoColumn(
        title: capactityBuildingColumns[index],
        field: capactityBuildingColumnIds[index],
      ),
    );
    rows = rowsForMemoData();
    super.initState();
  }

  List<PlutoRow> rowsForMemoData() {
    return List<PlutoRow>.generate(
      30,
      (index) => PlutoRow(
        cells: {
          's/n': PlutoCell(value: '${index + 1}'),
          'trainingdescription': PlutoCell(value: 'Staff Health and Safety Training'),
          'startdate': PlutoCell(value: '03/12/2022'),
          'trainingtype': PlutoCell(value: 'Team'),
          'duration': PlutoCell(value: '3days'),
          'trainingmode': PlutoCell(value: 'Physical'),
          'status': PlutoCell(value: 'Inprogress'),
          'action': PlutoCell(value: 'View more..'),
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PlutoGrid(
        key: widget.key,
        columns: cols,
        rows: rows,
        mode: PlutoGridMode.selectWithOneTap,
        configuration: CustomPlutoGridConfiguration(autoSize: true),
        createFooter: (stateManager) {
          stateManager.setPageSize(20, notify: true);
          return PlutoPagination(stateManager);
        },
      ),
    );
  }
}
