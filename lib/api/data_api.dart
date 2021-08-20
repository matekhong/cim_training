import 'package:cim_training/model/comment.dart';
import 'package:cim_training/model/machinestatus.dart';
import 'package:http/http.dart' as http;

class DataApi {
  static var client = http.Client();

  static Future<List<Comment>> fetchFilterComment(String postId) async {
    var response = await client.get(Uri.parse(
        "https://jsonplaceholder.typicode.com/posts/$postId/comments"));
    print("https://jsonplaceholder.typicode.com/posts/$postId/comments");
    if (response.statusCode == 200) {
      print(response.body);
      return commentFromJson(response.body);
    } else {
      print('Cannot download');
      return [];
    }
  }

  static Future<List<MachineStatus>> fetchFilterMachineStatus(
      String machineGR) async {
    var response = await client.get(
        Uri.parse("http://192.168.1.104:8888/doctor/api/mcstatus/$machineGR"));
    print("http://192.168.1.104:8888/doctor/api/mcstatus/$machineGR");
    if (response.statusCode == 200) {
      print(response.body);
      return machineStatusFromJson(response.body);
    } else {
      print('Cannot download');
      return [];
    }
  }
}
