import 'package:ez_trading_v2/core/app_asset.dart';
import 'package:ez_trading_v2/core/app_color.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {

  AppColor appColor = AppColor();

  void showToast(String msg){
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: msg,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 16,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: appColor.darkBackgroundContainerColor,
      textColor: appColor.defaultTextColor,
    );
  }

  bool isValidEmail(String email) {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  String getPairImg(String pair) {
    var asset = AppAsset(pair: pair);

    return asset.getImgPair(pair);
  }

  String convertTime(String openTime) {

    var dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(openTime)*1000).toLocal();

    return dateTime.toString().replaceAll('.000', '');
  }

}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}