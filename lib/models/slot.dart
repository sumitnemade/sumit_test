class Slot {
  int? id;
  String? slot_start;
  String? slot_end;
  String? name;
  String? last_name;
  int? phone;

  Slot({
    this.slot_start,
    this.slot_end,
    this.name,
    this.last_name,
    this.id,
    this.phone,
  });

  factory Slot.fromJson(Map<String?, dynamic> json) {
    return Slot(
      slot_start: json['slot_start'],
      slot_end: json['slot_end'],
      name: json['name'],
      last_name: json['last_name'],
      id: json['id'],
      phone: json['phone'],
    );
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['slot_start'] = this.slot_start;
    data['slot_end'] = this.slot_end;
    data['name'] = this.name;
    data['last_name'] = this.last_name;
    data['id'] = this.id;
    data['phone'] = this.phone;
    return data;
  }

  Map<String, Object?> toDbMap() {
    final Map<String, Object?> data = new Map<String, Object?>();
    data['slot_start'] = this.slot_start;
    data['slot_end'] = this.slot_end;
    data['name'] = this.name;
    data['last_name'] = this.last_name;
    data['id'] = this.id;
    data['phone'] = this.phone;

    return data;
  }
}
