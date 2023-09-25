// To parse this JSON data, do
//
//     final posetItemSet = posetItemSetFromJson(jsonString);

import 'dart:convert';

// PosetItemSet posetItemSetFromJson(String str) => PosetItemSet.fromJson(json.decode(str));
//
// String posetItemSetToJson(PosetItemSet data) => json.encode(data.toJson());

class PosetItemSet {
  String ebeln;
  String ebelp;
  String txz01;
  String matnr;
  String menge;
  String werks;
  String pstyp;
  String bwart;
  String lgort;
  String lifnr;
  String letyp;
  String expdt;
  String mfgdt;
  String licha;
  String charg;
  String erfmg;
  String kzbew;
  dynamic bldat;
  dynamic budat;
  String bktxt;
  String labst;
  String vmins;
  String speme;
  String mblnr;
  String frbnr;
  String xabln;
  String xblnr;
  String mbInsmk;
  String itemText;

  PosetItemSet({
    required this.ebeln,
    required this.ebelp,
    required this.txz01,
    required this.matnr,
    required this.menge,
    required this.werks,
    required this.pstyp,
    required this.bwart,
    required this.lgort,
    required this.lifnr,
    required this.letyp,
    required this.expdt,
    required this.mfgdt,
    required this.licha,
    required this.charg,
    required this.erfmg,
    required this.kzbew,
    required this.bldat,
    required this.budat,
    required this.bktxt,
    required this.labst,
    required this.vmins,
    required this.speme,
    required this.mblnr,
    required this.frbnr,
    required this.xabln,
    required this.xblnr,
    required this.mbInsmk,
    required this.itemText,
  });

  factory PosetItemSet.fromJson(Map<String, dynamic> json) => PosetItemSet(
    ebeln: json["Ebeln"],
    ebelp: json["Ebelp"],
    txz01: json["Txz01"],
    matnr: json["Matnr"],
    menge: json["Menge"],
    werks: json["Werks"],
    pstyp: json["PSTYP"],
    bwart: json["BWART"],
    lgort: json["LGORT"],
    lifnr: json["Lifnr"],
    letyp: json["Letyp"],
    expdt: json["Expdt"],
    mfgdt: json["Mfgdt"],
    licha: json["Licha"],
    charg: json["Charg"],
    erfmg: json["Erfmg"],
    kzbew: json["Kzbew"],
    bldat: json["Bldat"],
    budat: json["Budat"],
    bktxt: json["Bktxt"],
    labst: json["Labst"],
    vmins: json["Vmins"],
    speme: json["Speme"],
    mblnr: json["Mblnr"],
    frbnr: json["Frbnr"],
    xabln: json["Xabln"],
    xblnr: json["Xblnr"],
    mbInsmk: json["MB_Insmk"],
    itemText: json["item_text"],
  );

  Map<String, dynamic> toJson() => {
    "Ebeln": ebeln,
    "Ebelp": ebelp,
    "Txz01": txz01,
    "Matnr": matnr,
    "Menge": menge,
    "Werks": werks,
    "PSTYP": pstyp,
    "BWART": bwart,
    "LGORT": lgort,
    "Lifnr": lifnr,
    "Letyp": letyp,
    "Expdt": expdt,
    "Mfgdt": mfgdt,
    "Licha": licha,
    "Charg": charg,
    "Erfmg": erfmg,
    "Kzbew": kzbew,
    "Bldat": bldat,
    "Budat": budat,
    "Bktxt": bktxt,
    "Labst": labst,
    "Vmins": vmins,
    "Speme": speme,
    "Mblnr": mblnr,
    "Frbnr": frbnr,
    "Xabln": xabln,
    "Xblnr": xblnr,
    "MB_Insmk": mbInsmk,
    "item_text": itemText,
  };
}
