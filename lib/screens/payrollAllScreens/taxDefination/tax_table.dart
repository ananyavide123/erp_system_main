import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../reusables/pluto_column_config.dart';

///Column name and ids
List<String> allStaffColumns = [
  "S/N",
  "Tax Type",
  "% value",
  "Action",
];
List<String> allStaffColumnIds = allStaffColumns.map((e) => e.replaceAll(" ", "").toLowerCase()).toList();

class TaxTable extends StatefulWidget {
  const TaxTable({
    super.key,
  });
  @override
  State<TaxTable> createState() => _TaxTableState();
}

class _TaxTableState extends State<TaxTable> {
  List<PlutoColumn> cols = [];
  List<PlutoRow> rows = [];

  @override
  void initState() {
    cols = List.generate(
      allStaffColumns.length,
      (index) => CustomPlutoColumn(
        title: allStaffColumns[index],
        field: allStaffColumnIds[index],
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
          'taxtype': PlutoCell(value: 'NHIS'),
          '%value': PlutoCell(value: '2%'),
          'action': PlutoCell(value: 'Edit'),
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
