import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../reusables/pluto_column_config.dart';
import '../../reusables/formaters.dart';

///Column name and ids
List<String> logisticColumns = [
  "S/N",
  "Title",
  "Purpose",
  "Amount",
  "Requested By",
  "Sent To",
  "Date",
  "Status",
  "Action",
];
List<String> logisticColumnIds = logisticColumns.map((e) => e.replaceAll(" ", "").toLowerCase()).toList();

class LogisticTable extends StatefulWidget {
  const LogisticTable({
    super.key,
  });
  @override
  State<LogisticTable> createState() => _LogisticTableState();
}

class _LogisticTableState extends State<LogisticTable> {
  List<PlutoColumn> cols = [];
  List<PlutoRow> rows = [];

  @override
  void initState() {
    cols = List.generate(
      logisticColumns.length,
      (index) => CustomPlutoColumn(
        title: logisticColumns[index],
        field: logisticColumnIds[index],
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
          'title': PlutoCell(value: 'Request for travel time'),
          'purpose': PlutoCell(value: 'Training ourse'),
          'amount': PlutoCell(value: '360,000.00'),
          'requestedby': PlutoCell(value: 'Otor John Stephen'),
          'sentto': PlutoCell(value: 'Hassana Husseini'),
          'date': PlutoCell(value: formattedDate(DateTime.now())),
          'status': PlutoCell(value: 'Pending'),
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
