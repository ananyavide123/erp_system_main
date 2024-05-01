import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../reusables/pluto_column_config.dart';
import '../../reusables/formaters.dart';

///Column name and ids
List<String> circularColumns = [
  "S/N",
  "Circular Title",
  "Sent From",
  "Sent To",
  "Date",
  "Circular Type",
  "Action",
];
List<String> circularColumnIds = circularColumns.map((e) => e.replaceAll(" ", "").toLowerCase()).toList();

class CircularTable extends StatefulWidget {
  const CircularTable({
    super.key,
  });
  @override
  State<CircularTable> createState() => _CircularTableState();
}

class _CircularTableState extends State<CircularTable> {
  List<PlutoColumn> cols = [];
  List<PlutoRow> rows = [];

  @override
  void initState() {
    cols = List.generate(
      circularColumns.length,
      (index) => CustomPlutoColumn(
        title: circularColumns[index],
        field: circularColumnIds[index],
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
          'circulartitle': PlutoCell(value: 'HR Circular for Operations Department Staff'),
          'sentfrom': PlutoCell(value: 'Admin, HR'),
          'sentto': PlutoCell(value: 'Operations Staff'),
          'date': PlutoCell(value: formattedDate(DateTime.now())),
          'circulartype': PlutoCell(value: 'Sent'),
          'action': PlutoCell(value: 'View more'),
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
