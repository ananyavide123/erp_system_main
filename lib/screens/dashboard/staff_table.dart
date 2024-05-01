import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../reusables/pluto_column_config.dart';

///Column name and ids
List<String> memoColumns = [
  "S/N",
  "Staff Name",
  "Staff Role",
  "Designation",
  "status",
];
List<String> memoColumnIds = memoColumns.map((e) => e.replaceAll(" ", "").toLowerCase()).toList();

class StaffTable extends StatefulWidget {
  const StaffTable({
    super.key,
  });
  @override
  State<StaffTable> createState() => _StaffTableState();
}

class _StaffTableState extends State<StaffTable> {
  List<PlutoColumn> cols = [];
  List<PlutoRow> rows = [];

  @override
  void initState() {
    cols = List.generate(
      memoColumns.length,
      (index) => CustomPlutoColumn(
        title: memoColumns[index],
        field: memoColumnIds[index],
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
          'staffname': PlutoCell(value: 'Abubakar Ismalia Goje'),
          'staffrole': PlutoCell(value: 'Admin'),
          'designation': PlutoCell(value: 'Human Resource Dept..'),
          'status': PlutoCell(value: 'Pending'),
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PlutoGrid(
        columns: cols,
        rows: rows,
        mode: PlutoGridMode.selectWithOneTap,
        configuration: CustomPlutoGridConfiguration(),
      ),
    );
  }
}
