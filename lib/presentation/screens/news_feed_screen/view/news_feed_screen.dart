import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../assets/animations.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';
import '../../../../values/strings.dart';
import '../../../../widgets/utility_widgets/state_with_animation_message_widget.dart';
import '../../../common_cubits/internet_cubit/internet_cubit.dart';
import '../../../common_cubits/internet_cubit/internet_state.dart';
import '../cubit/news_feed_cubit.dart';
import '../cubit/news_feed_state.dart';
import '../widgets/top_headlines_list_widget.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppStrings.appName,
          style: AppTextStyles.tsMontBoldBlueDark18,
        ),
      ),
      backgroundColor: AppColors.grey,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
        child: BlocListener<InternetCubit, InternetState>(
          listener: (blocContext, state) {
            context.read<NewsCubit>().fetch();
          },
          listenWhen: (blocContext, state) {
            final isNewsResultNotFetched =
                context.read<NewsCubit>().state is NewsFetchFailure ||
                    context.read<NewsCubit>().state is NewsFetchNothing;
            return isNewsResultNotFetched && state is InternetConnected;
          },
          child: Builder(builder: (context) {
            final internetState = context.watch<InternetCubit>().state;
            final newsState = context.watch<NewsCubit>().state;

            if (newsState is NewsFetchedSuccess) {
              return TopHeadlinesWidget(
                newsList: newsState.newsModelList,
              );
            } else if (internetState is InternetDisconnected) {
              return const StateWithAnimationMessageWidget(
                animationAsset: Animations.noInternet,
                stateTextMessage: ErrorMessagesStrings.noInternet,
                slotWidget: _TryAgainFetchNewsButton(),
              );
            } else if (newsState is NewsFetchLoading ||
                newsState is NewsFetchNothing) {
              return const StateWithAnimationMessageWidget(
                animationAsset: Animations.loading,
                stateTextMessage: HomeStrings.fetchNews,
              );
            } else if (newsState is NewsFetchFailure &&
                internetState is InternetConnected) {
              return StateWithAnimationMessageWidget(
                animationAsset: Animations.error,
                stateTextMessage: newsState.errorMessage,
                slotWidget: const _TryAgainFetchNewsButton(),
              );
            } else {
              return const StateWithAnimationMessageWidget(
                animationAsset: Animations.error,
                stateTextMessage: ErrorMessagesStrings.somethingWentWrong,
                slotWidget: _TryAgainFetchNewsButton(),
              );
            }
          }),
        ),
      ),
    );
  }
}

class _TryAgainFetchNewsButton extends StatelessWidget {
  const _TryAgainFetchNewsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.read<NewsCubit>().fetch,
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColors.blue_4E5),
          padding:
              MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 16))),
      child: const Text(
        CommonStrings.tryAgain,
        style: AppTextStyles.tsMontSemiBoldWhite12,
      ),
    );
  }
}
