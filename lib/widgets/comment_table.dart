import 'package:cim_training/api/data_api.dart';
import 'package:cim_training/model/comment.dart';
import 'package:flutter/material.dart';

class CommentTable extends StatelessWidget {
  final String postId;
  const CommentTable({
    Key? key,
    required this.postId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> columns = ['Post ID', 'ID', 'Name', 'Email', 'Body'];

    return FutureBuilder(
        future: DataApi.fetchFilterComment(postId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var comments = snapshot.data as List<Comment>;
            return DataTable(
              sortColumnIndex: 0,
              sortAscending: true,
              columns: [
                for (String column in columns) DataColumn(label: Text(column)),
              ],
              rows: [
                for (Comment comment in comments)
                  DataRow(cells: [
                    DataCell(Text(
                      comment.postId.toString(),
                    )),
                    DataCell(
                        Text(
                          comment.id.toString(),
                        ),
                        showEditIcon: true),
                    DataCell(Text(comment.name.toString())),
                    DataCell(Text(comment.email.toString())),
                    DataCell(Text(comment.body.toString())),
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
