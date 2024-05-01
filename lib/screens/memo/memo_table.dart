import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../reusables/pluto_column_config.dart';
import '../../reusables/formaters.dart';

///Column name and ids
List<String> allStaffColumns = [
  "S/N",
  "Memo Title",
  "Sent From",
  "Sent To",
  "Date",
  "Attachment",
  "Memo Type",
  "Action",
];
List<String> allStaffColumnIds = allStaffColumns.map((e) => e.replaceAll(" ", "").toLowerCase()).toList();

class MemoScreenTable extends StatefulWidget {
  const MemoScreenTable({
    super.key,
  });
  @override
  State<MemoScreenTable> createState() => _MemoScreenTableState();
}

class _MemoScreenTableState extends State<MemoScreenTable> {
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
          'memotitle': PlutoCell(value: 'Operations memo'),
          'sentfrom': PlutoCell(value: 'Williams Achegbani'),
          'sentto': PlutoCell(value: 'Chief Operations Officer'),
          'date': PlutoCell(value: formattedDate(DateTime.now())),
          'attachment': PlutoCell(value: 'Yes'),
          'memotype': PlutoCell(value: 'Sent'),
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
