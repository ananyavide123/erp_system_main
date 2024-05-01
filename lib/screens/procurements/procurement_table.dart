import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../reusables/formaters.dart';
import '../../reusables/pluto_column_config.dart';

///Column name and ids
List<String> procurementColumns = [
  "S/N",
  "Item",
  "Qty",
  "Amount",
  "Requested By",
  "Sent To",
  "Date",
  "Status",
  "Action",
];
List<String> procurementColumnIds = procurementColumns.map((e) => e.replaceAll(" ", "").toLowerCase()).toList();

class ProcurementTable extends StatefulWidget {
  const ProcurementTable({
    super.key,
  });
  @override
  State<ProcurementTable> createState() => _ProcurementTableState();
}

class _ProcurementTableState extends State<ProcurementTable> {
  List<PlutoColumn> cols = [];
  List<PlutoRow> rows = [];

  @override
  void initState() {
    cols = List.generate(
      procurementColumns.length,
      (index) => CustomPlutoColumn(
        title: procurementColumns[index],
        field: procurementColumnIds[index],
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
          'item': PlutoCell(value: 'Office chairs'),
          'qty': PlutoCell(value: '20'),
          'amount': PlutoCell(value: '360,000.00'),
          "requestedby": PlutoCell(value: 'Otor Hashim'),
          'sentto': PlutoCell(value: 'Farukh Hashim'),
          'date': PlutoCell(value: formattedDate(DateTime.now())),
          'status': PlutoCell(value: 'Pending'),
          'action': PlutoCell(value: 'View More'),
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
        configuration: CustomPlutoGridConfiguration(autoSize: false),
        createFooter: (stateManager) {
          stateManager.setPageSize(20, notify: true);
          return PlutoPagination(stateManager);
        },
      ),
    );
  }
}
