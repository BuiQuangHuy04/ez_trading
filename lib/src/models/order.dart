class Order {
  String _ticket = '';
  String _pair = '';
  String _type = '';
  String _lots = '';
  String _openTime = '';
  String _openPrice = '';
  String _tp = '';
  String _sl = '';
  String _closePrice = '';
  String _comment = '';

  Order(
      {required String ticket,
        required String pair,
        required String type,
        required String lots,
        required String openTime,
        required String openPrice,
        required String tp,
        required String sl,
        required String closePrice,
        required String comment}) {
    _ticket = ticket;
    _pair = pair;
    _type = type;
    _lots = lots;
    _openTime = openTime;
    _openPrice = openPrice;
    _tp = tp;
    _sl = sl;
    _closePrice = closePrice;
    _comment = comment;
  }

  String get ticket => _ticket;
  set ticket(String ticket) => _ticket = ticket;
  String get pair => _pair;
  set pair(String pair) => _pair = pair;
  String get type => _type;
  set type(String type) => _type = type;
  String get lots => _lots;
  set lots(String lots) => _lots = lots;
  String get openTime => _openTime;
  set openTime(String openTime) => _openTime = openTime;
  String get openPrice => _openPrice;
  set openPrice(String openPrice) => _openPrice = openPrice;
  String get tp => _tp;
  set tp(String tp) => _tp = tp;
  String get sl => _sl;
  set sl(String sl) => _sl = sl;
  String get closePrice => _closePrice;
  set closePrice(String closePrice) => _closePrice = closePrice;
  String get comment => _comment;
  set comment(String comment) => _comment = comment;

  Order.fromJson(Map<String, dynamic> json) {
    _ticket = json['ticket'];
    _pair = _cleanPair(json['pair']);
    _type = json['type'];
    _lots = json['lots'];
    _openTime = json['openTime'];
    _openPrice = json['openPrice'];
    _tp = json['tp'];
    _sl = json['sl'];
    _closePrice = json['closePrice'];
    _comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ticket'] = _ticket;
    data['pair'] = _pair;
    data['type'] = _type;
    data['lots'] = _lots;
    data['openTime'] = _openTime;
    data['openPrice'] = _openPrice;
    data['tp'] = _tp;
    data['sl'] = _sl;
    data['closePrice'] = _closePrice;
    data['comment'] = _comment;
    return data;
  }

  @override
  String toString() {
    return 'Order{\n_ticket: $_ticket, \n_pair: $_pair, \n_type: $_type, '
      '\n_lots: $_lots, \n_openTime: $_openTime, \n_openPrice: $_openPrice, '
      '\n_tp: $_tp, \n_sl: $_sl, \n_closePrice: $_closePrice, '
        '\n_comment: $_comment}';
  }

  String _cleanPair(String pair) {
    if(pair.length > 6) {
      if(pair == 'USCRUDE_f' || pair == 'UKBRENT_f'){
        pair = pair.substring(0, pair.length-2);
      } else if(pair.endsWith('m') || pair.endsWith('f')) {
        pair = pair.substring(0, pair.length-1);
        if(pair.endsWith('_')) {
          pair = pair.substring(0, pair.length-1);
        }
      }
    }

    return pair;
  }
}
