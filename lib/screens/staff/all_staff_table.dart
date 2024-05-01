import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../reusables/pluto_column_config.dart';

///Column name and ids
List<String> allStaffColumns = [
  "S/N",
  "First Name",
  "Last Name",
  "Gender",
  "Staff ID",
  "Phone Number",
  "Role",
  "Designation",
  "Action",
];
List<String> allStaffColumnIds = allStaffColumns.map((e) => e.replaceAll(" ", "").toLowerCase()).toList();

class AllStaffTable extends StatefulWidget {
  const AllStaffTable({
    super.key,
  });
  @override
  State<AllStaffTable> createState() => _AllStaffTableState();
}

class _AllStaffTableState extends State<AllStaffTable> {
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
          'firstname': PlutoCell(value: 'Sandra'),
          'lastname': PlutoCell(value: 'Williams'),
          'gender': PlutoCell(value: 'Female'),
          'staffid': PlutoCell(value: '0246AHR'),
          'phonenumber': PlutoCell(value: '08130000000'),
          'role': PlutoCell(value: 'Admin'),
          'designation': PlutoCell(value: 'HR'),
          'action': PlutoCell(value: 'View more..'),
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
