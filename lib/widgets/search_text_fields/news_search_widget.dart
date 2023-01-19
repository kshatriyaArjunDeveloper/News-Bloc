import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hello/hello.dart';
import 'package:news_bloc/values/strings.dart';

import '../../../../assets/images.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AllRoundedContainer(
      color: AppColors.white,
      allCornerRadius: 12,
      verticalPadding: 4,
      horizontalPadding: 20,
      boxShadowList: [
        const BoxShadow(
          color: Color(0x1A202C08),
          blurRadius: 6,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
      child: Row(
        children: [
          SvgPicture.asset(
            Images.search,
            color: AppColors.grey_3BF,
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: TextField(
              style: AppTextStyles.tsMontRegBlue_02C_14,
              cursorColor: AppColors.blue_4E5,
              cursorHeight: 20,
              decoration: InputDecoration(
                  hintText: SearchStrings.searchHint,
                  hintStyle: AppTextStyles.tsMontRegGrey_3BF_14,
                  border: InputBorder.none),
              // onSubmitted: (text) => search(text.trim()),
              // onChanged: (text) => search(text.trim()),
            ),
          ),
        ],
      ),
    );
  }
}
