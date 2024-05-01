import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../../reusables/pluto_column_config.dart';

///Column name and ids
List<String> stockColumns = [
  "S/N",
  "Product Name",
  "Product ID",
  "Category",
  "QTY Purchased",
  "Unit Price",
  "Total Amount",
  "In-Stock",
  "Supplier",
  "Status",
];
List<String> stockColumnIds = stockColumns.map((e) => e.replaceAll(" ", "").toLowerCase()).toList();

class StockTable extends StatefulWidget {
  const StockTable({
    super.key,
  });
  @override
  State<StockTable> createState() => _StockTableState();
}

class _StockTableState extends State<StockTable> {
  List<PlutoColumn> cols = [];
  List<PlutoRow> rows = [];

  @override
  void initState() {
    cols = List.generate(
      stockColumns.length,
      (index) => CustomPlutoColumn(
        title: stockColumns[index],
        field: stockColumnIds[index],
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
          'productname': PlutoCell(value: 'Pen'),
          'productid': PlutoCell(value: '45656787'),
          'category': PlutoCell(value: 'Stationaries'),
          'qtypurchased': PlutoCell(value: '50pcs'),
          'unitprice': PlutoCell(value: '100.00'),
          'totalamount': PlutoCell(value: '5,000.00'),
          'in-stock': PlutoCell(value: '40pcs'),
          'supplier': PlutoCell(value: 'Big Ben Store'),
          'status': PlutoCell(value: 'In stock'),
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
