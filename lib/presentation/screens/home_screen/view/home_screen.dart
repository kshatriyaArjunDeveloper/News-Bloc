import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_bloc/business_logic/cubits/news_cubit/news_cubit.dart';
import 'package:news_bloc/business_logic/cubits/news_cubit/news_fetch_state.dart';
import 'package:news_bloc/core/utility/data/network_requester.dart';
import 'package:news_bloc/core/values/animations.dart';
import 'package:news_bloc/core/values/strings.dart';
import 'package:news_bloc/data/data_source/news_api_remote_data_source.dart';
import 'package:news_bloc/domain/models/news_model.dart';
import 'package:news_bloc/presentation/screens/home_screen/widgets/top_headlines_list_widget.dart';
import 'package:news_bloc/presentation/theme/app_colors.dart';
import 'package:news_bloc/presentation/theme/app_text_styles.dart';

import '../../../../business_logic/cubits/internet_cubit/internet_cubit.dart';
import '../../../../business_logic/cubits/internet_cubit/internet_state.dart';
import '../../../../core/values/images.dart';
import '../../../widgets/state_with_animation_message_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                slotWidget: TryAgainFetchNewsButton(),
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
                slotWidget: const TryAgainFetchNewsButton(),
              );
            } else {
              return const StateWithAnimationMessageWidget(
                animationAsset: Animations.error,
                stateTextMessage: ErrorMessagesStrings.somethingWentWrong,
                slotWidget: TryAgainFetchNewsButton(),
              );
            }
          }),
        ),
      ),
    );
  }
}

class TryAgainFetchNewsButton extends StatelessWidget {
  const TryAgainFetchNewsButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: context.read<NewsCubit>().fetch,
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColors.blue),
          padding:
              MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 16))),
      child: const Text(
        CommonStrings.tryAgain,
        style: AppTextStyles.tsMontSemiBoldWhite12,
      ),
    );
  }
}
