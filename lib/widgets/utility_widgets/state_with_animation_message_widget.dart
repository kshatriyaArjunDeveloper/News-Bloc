import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

import '../../theme/app_text_styles.dart';

class StateWithAnimationMessageWidget extends StatelessWidget {
  final String animationAsset;
  final String stateTextMessage;
  final Widget? slotWidget;

  const StateWithAnimationMessageWidget({
    Key? key,
    required this.animationAsset,
    required this.stateTextMessage,
    this.slotWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            animationAsset,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            stateTextMessage,
            textAlign: TextAlign.center,
            style: AppTextStyles.tsMontBoldBlueDark18,
          ),
          const SizedBox(
            height: 24,
          ),
          if (slotWidget != null) slotWidget!,
        ],
      ),
    );
  }
}