import 'dart:convert';

List<MachineStatus> machineStatusFromJson(String str) {
  return List<MachineStatus>.from(
      json.decode(str).map((x) => MachineStatus.fromJson(x)));
}

class MachineStatus {
  String? machgrCd;
  String? machCd;
  String? moldNo;
  String? partsNo;
  String? quantity;
  String? workerName;
  String? workerCd;
  String? startupTime;
  String? compltRemainHour;

  MachineStatus(
      {this.machgrCd,
      this.machCd,
      this.moldNo,
      this.partsNo,
      this.quantity,
      this.workerName,
      this.workerCd,
      this.startupTime,
      this.compltRemainHour});

  MachineStatus.fromJson(Map<String, dynamic> json) {
    machgrCd = json['machgr_cd'];
    machCd = json['mach cd'];
    moldNo = json['mold no.'];
    partsNo = json['parts no.'];
    quantity = json['quantity'];
    workerName = json['worker name'];
    workerCd = json['worker cd'];
    startupTime = json['startup time'];
    compltRemainHour = json['complt remain hour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['machgr_cd'] = this.machgrCd;
    data['mach cd'] = this.machCd;
    data['mold no.'] = this.moldNo;
    data['parts no.'] = this.partsNo;
    data['quantity'] = this.quantity;
    data['worker name'] = this.workerName;
    data['worker cd'] = this.workerCd;
    data['startup time'] = this.startupTime;
    data['complt remain hour'] = this.compltRemainHour;
    return data;
  }
}
