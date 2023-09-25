

class Poset {
  String ebeln;
  String bsart;
  String bstyp;
  String name1;
  String lifnr;
  String aedat;
  String werks;
  String mblnr;
  String billOfLadding;
  String grGiSlipNo;
  String headerTxt;

  Poset({
    required this.ebeln,
    required this.bsart,
    required this.bstyp,
    required this.name1,
    required this.lifnr,
    required this.aedat,
    required this.werks,
    required this.mblnr,
    required this.billOfLadding,
    required this.grGiSlipNo,
    required this.headerTxt,
  });

  factory Poset.fromJson(Map<String, dynamic> json) => Poset(
    ebeln: json["Ebeln"],
    bsart: json["Bsart"],
    bstyp: json["Bstyp"],
    name1: json["Name1"],
    lifnr: json["Lifnr"],
    aedat: json["Aedat"],
    werks: json["Werks"],
    mblnr: json["Mblnr"],
    billOfLadding: json["bill_of_ladding"],
    grGiSlipNo: json["gr_gi_slip_no"],
    headerTxt: json["header_txt"],
  );

  Map<String, dynamic> toJson() => {
    "Ebeln": ebeln,
    "Bsart": bsart,
    "Bstyp": bstyp,
    "Name1": name1,
    "Lifnr": lifnr,
    "Aedat": aedat,
    "Werks": werks,
    "Mblnr": mblnr,
    "bill_of_ladding": billOfLadding,
    "gr_gi_slip_no": grGiSlipNo,
    "header_txt": headerTxt,
  };
}
