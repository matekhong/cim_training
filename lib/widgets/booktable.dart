import 'package:cim_training/api/book_api.dart';
import 'package:cim_training/model/book.dart';
import 'package:flutter/material.dart';

class BookTable extends StatelessWidget {
  const BookTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> columns = ['User ID', 'ID', 'Title', 'Body'];

    return FutureBuilder(
        future: BookApi.fetchBookData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var books = snapshot.data as List<Book>;
            return DataTable(
              sortColumnIndex: 0,
              sortAscending: true,
              columns: [
                for (String column in columns) DataColumn(label: Text(column)),
              ],
              rows: [
                for (Book book in books)
                  DataRow(cells: [
                    DataCell(Text(
                      book.userId.toString(),
                    )),
                    DataCell(
                        Text(
                          book.id.toString(),
                        ),
                        showEditIcon: true),
                    DataCell(Text(book.title.toString())),
                    DataCell(Text(book.body.toString())),
                  ])
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
