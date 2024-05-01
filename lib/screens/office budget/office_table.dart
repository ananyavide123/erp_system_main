import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../reusables/pluto_column_config.dart';
import '../../reusables/formaters.dart';

///Column name and ids
List<String> officeColumns = [
  "S/N",
  "Budget No.",
  "Budget Description",
  "Budgeted Amount",
  "Actual Amount",
  "Variance",
];
List<String> officeColumnIds = officeColumns.map((e) => e.replaceAll(" ", "").toLowerCase()).toList();

class OfficeTable extends StatefulWidget {
  const OfficeTable({
    super.key,
  });
  @override
  State<OfficeTable> createState() => _OfficeTableState();
}

class _OfficeTableState extends State<OfficeTable> {
  List<PlutoColumn> cols = [];
  List<PlutoRow> rows = [];

  @override
  void initState() {
    cols = List.generate(
      officeColumns.length,
      (index) => CustomPlutoColumn(
        title: officeColumns[index],
        field: officeColumnIds[index],
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
          'budgetno.': PlutoCell(value: '00211235'),
          'budgetdescription': PlutoCell(value: 'Purchase of 10 units,2Hp Hisense Air Conditions'),
          'budgetedamount': PlutoCell(value: '1,400,000.00'),
          'actualamount': PlutoCell(value: '1,380,000.00'),
          'variance': PlutoCell(value: '+ 20,000.00'),
          'date': PlutoCell(value: formattedDate(DateTime.now())),
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
