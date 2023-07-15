class AppAsset {
  final String pair;
  const AppAsset({required this.pair});

  /*final aav = 'assets/images/AAV.svg';
  final ada = 'assets/images/ADA.svg';
  final alg = 'assets/images/ALG.svg';
  final ali = 'assets/images/ALI.svg';
  final ant = 'assets/images/ANT.svg';
  final ato = 'assets/images/ATO.svg';
  final alp = 'assets/images/ALP.svg';
  final aud = 'assets/images/AUD.svg';
  final avx = 'assets/images/AVX.svg';
  final axs = 'assets/images/AXS.svg';
  final bch = 'assets/images/BCH.svg';
  final bnb = 'assets/images/BNB.svg';
  final btc = 'assets/images/BTC.svg';
  final cad = 'assets/images/CAD.svg';
  final chf = 'assets/images/CHF.svg';
  final chz = 'assets/images/CHZ.svg';
  final com = 'assets/images/COM.svg';
  final dat = 'assets/images/DAT.svg';
  final dgb = 'assets/images/DGB.svg';
  final dge = 'assets/images/DGE.svg';
  final dot = 'assets/images/DOT.svg';
  final dsh = 'assets/images/DSH.svg';
  final enj = 'assets/images/ENJ.svg';
  final eos = 'assets/images/EOS.svg';
  final etc = 'assets/images/ETC.svg';
  final eth = 'assets/images/ETH.svg';
  final eur = 'assets/images/EUR.svg';
  final fil = 'assets/images/FIL.svg';
  final gbp = 'assets/images/GBP.svg';
  final glm = 'assets/images/GLM.svg';
  final icp = 'assets/images/ICP.svg';
  final ilv = 'assets/images/ILV.svg';
  final ita = 'assets/images/ITA.svg';
  final jpy = 'assets/images/JPY.svg';
  final kav = 'assets/images/KAV.svg';
  final lnk = 'assets/images/LNK.svg';
  final ltc = 'assets/images/LTC.svg';
  final mkr = 'assets/images/MKR.svg';
  final mna = 'assets/images/MNA.svg';
  final msk = 'assets/images/MSK.svg';
  final mtc = 'assets/images/MTC.svg';
  final nea = 'assets/images/NEA.svg';
  final neo = 'assets/images/NEO.svg';
  final nul = 'assets/images/NUL.svg';
  final nzd = 'assets/images/NZD.svg';
  final omg = 'assets/images/OMG.svg';
  final qtm = 'assets/images/QTM.svg';
  final ref = 'assets/images/REF.svg';
  final sia = 'assets/images/SIA.svg';
  final snd = 'assets/images/SND.svg';
  final snt = 'assets/images/SNT.svg';
  final sol = 'assets/images/SOL.svg';
  final str = 'assets/images/STR.svg';
  final stx = 'assets/images/STX.svg';
  final sun = 'assets/images/SUN.svg';
  final tht = 'assets/images/THT.svg';
  final tlm = 'assets/images/TLM.svg';
  final trx = 'assets/images/TRX.svg';
  final uni = 'assets/images/UNI.svg';
  final usd = 'assets/images/USD.svg';
  final vet = 'assets/images/VET.svg';
  final wav = 'assets/images/WAV.svg';
  final xag = 'assets/images/XAG.svg';
  final xau = 'assets/images/XAU.svg';
  final xlm = 'assets/images/XLM.svg';
  final xmr = 'assets/images/XMR.svg';
  final xng = 'assets/images/XNG.svg';
  final xrp = 'assets/images/XRP.svg';
  final xtz = 'assets/images/XTZ.svg';
  final yfi = 'assets/images/YFI.svg';
  final ygg = 'assets/images/YGG.svg';
  final zec = 'assets/images/ZEC.svg';
  final zil = 'assets/images/ZIL.svg';
  final ukbrent = 'assets/images/UKBRENT.svg';
  final usbrent = 'assets/images/USCRUDE.svg';*/

  String getImgPair(String pair) {
    pair = pair.toUpperCase();

    return 'assets/images/$pair.svg';
  }
}