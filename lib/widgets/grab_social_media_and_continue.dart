import 'package:flutter/material.dart';
import 'package:keri_shipper/constants/constant.dart';
import 'package:keri_shipper/widgets/grab_button_login_social_media.dart';
import 'package:keri_shipper/widgets/grab_continue_button.dart';

class GrabSocialMediaAndContinue extends StatelessWidget {
  const GrabSocialMediaAndContinue({
    required this.isKeyboardShowing,
  });

  final bool isKeyboardShowing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        bottom:
            isKeyboardShowing ? 0 : MediaQuery.of(context).viewPadding.bottom,
      ),
      color: isKeyboardShowing ? Theme.of(context).primaryColor : Colors.white,
      child: isKeyboardShowing
          ? GrabContinueButton()
          : Row(
              children: <Widget>[
                Expanded(
                  child: GrabBottonLoginSocialMedia(
                    image: "assets/images/facebook.png",
                    imageColor: Colors.white,
                    title: "Facebook",
                    textStyle: kGrabWhiteRegularSmall.copyWith(fontSize: 18),
                    backgroundColor: Color(0xFF3C5A98),
                  ),
                ),
                Expanded(
                  child: GrabBottonLoginSocialMedia(
                    image: "assets/images/google.png",
                    title: "Google",
                    textStyle: kGrabWhiteRegularSmall.copyWith(
                        fontSize: 18, color: Colors.grey[700]),
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
    );
  }
}
