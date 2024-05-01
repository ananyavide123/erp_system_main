import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../reusables/pluto_column_config.dart';

///Column name and ids
List<String> memoColumns = [
  "S/N",
  "Subject",
  "Date",
  "Status",
];
List<String> memoColumnIds = memoColumns.map((e) => e.replaceAll(" ", "").toLowerCase()).toList();

class PaymentTable extends StatefulWidget {
  const PaymentTable({
    super.key,
  });
  @override
  State<PaymentTable> createState() => _PaymentTableState();
}

class _PaymentTableState extends State<PaymentTable> {
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
          'subject': PlutoCell(value: 'Request for FARS for October 2022'),
          'date': PlutoCell(value: '25/01/2023'),
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
