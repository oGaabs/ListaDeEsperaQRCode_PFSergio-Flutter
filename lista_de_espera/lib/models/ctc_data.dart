class ctcData {
  String ra;
  String data;
  String lati;
  String longi;

  ctcData(this.ra, this.data, this.lati, this.longi);

  Map toJson() => {'ra': ra, 'data': data, 'lati': lati, 'longi': longi};

  factory ctcData.fromJson(dynamic json) {
    if (json['lati'] == null) json['lati'] = '0';
    if (json['longi'] == null) json['longi'] = '0';

    return ctcData(json['ra'] as String, json['data'] as String,
        json['lati'] as String, json['longi'] as String);
  }
  
  @override
  String toString() {
    // TODO: implement toString
    return '{${this.ra}, ${this.data},${this.lati}, ${this.longi}}';
  }
}
