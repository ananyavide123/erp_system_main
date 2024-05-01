import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../reusables/pluto_column_config.dart';

///Column name and ids
List<String> memoColumns = [
  "S/N",
  "Memo Title",
  "Sent From",
  "Sent To",
  "Status",
];
List<String> memoColumnIds = memoColumns.map((e) => e.replaceAll(" ", "").toLowerCase()).toList();

class MemoTable extends StatefulWidget {
  const MemoTable({
    super.key,
  });
  @override
  State<MemoTable> createState() => _MemoTableState();
}

class _MemoTableState extends State<MemoTable> {
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
          'memotitle': PlutoCell(value: 'Operation memo'),
          'sentfrom': PlutoCell(value: 'Otor John'),
          'sentto': PlutoCell(value: 'ibrahim sadiq'),
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
