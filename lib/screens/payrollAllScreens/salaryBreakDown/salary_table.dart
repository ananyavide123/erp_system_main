import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../reusables/pluto_column_config.dart';

///Column name and ids
List<String> allStaffColumns = [
  "S/N",
  "Title",
  "Level",
  "Basicsalary",
  "Allowance",
  "Grosssalary",
  "Deductions",
  "Netsalary",
  "Action",
];
List<String> allStaffColumnIds = allStaffColumns.map((e) => e.replaceAll(" ", "").toLowerCase()).toList();

class SalaryTable extends StatefulWidget {
  const SalaryTable({
    super.key,
  });
  @override
  State<SalaryTable> createState() => _SalaryTableState();
}

class _SalaryTableState extends State<SalaryTable> {
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
          'title': PlutoCell(value: 'Managing Director'),
          'level': PlutoCell(value: 'MD/CEO'),
          'basicsalary': PlutoCell(value: '445,331.000'),
          'allowance': PlutoCell(value: '600,000.00'),
          'grosssalary': PlutoCell(value: '08130000000'),
          'deductions': PlutoCell(value: '224,000.00'),
          'netsalary': PlutoCell(value: '224,000.00'),
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
