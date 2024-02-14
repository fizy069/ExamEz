// import 'dart:io';

// class TableRow {
//   final String column2;
//   final String column10;

//   TableRow({required this.column2, required this.column10});
// }

// Future<void> main() async {
//   final file = File('path_to_your_pdf_file.pdf');
//   final bytes = await file.readAsBytes();

//   final document = Document();

//   // Load the PDF document
//   final pdf = PdfDocumentLoader(bytes);

//   // Extract text from each page
//   final List<String> texts = [];
//   for (var page in pdf.pages) {
//     final text = await page.text;
//     texts.add(text);
//   }

//   // Extract table data
//   final tableData = extractTableData(texts);

//   // Print the extracted table data
//   for (var row in tableData) {
//     print('Column 2: ${row.column2}, Column 10: ${row.column10}');
//   }
// }

// List<TableRow> extractTableData(List<String> texts) {
//   final List<TableRow> tableData = [];

//   // Your logic to identify and extract table data
//   // This can involve parsing the text to find patterns that represent the table structure
//   // and then extracting the relevant data accordingly.
//   // Regular expressions or specific keywords can be helpful for this task.

//   // For demonstration, let's assume a simple case where we just split the text by lines
//   // and assume each line represents a row in the table.
//   for (var text in texts) {
//     final rows = text.split('\n');
//     for (var row in rows) {
//       final rowData = row.split('\t');
//       if (rowData.length >= 12) {
//         final column2 = rowData[1]; // 2nd column
//         final column10 = rowData[9]; // 10th column
//         tableData.add(TableRow(column2: column2, column10: column10));
//       }
//     }
//   }

//   return tableData;
// }
