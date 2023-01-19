import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bloc/domain/repositories/news_repository.dart';

import 'news_feed_state.dart';

class NewsCubit extends Cubit<NewsFetchState> {
  final NewsRepository newsRepository;

  NewsCubit({required this.newsRepository}) : super(NewsFetchNothing());

  Future<void> fetch() async {
    emit(NewsFetchLoading());
    final newsListResult = await newsRepository.getNews();
    if (newsListResult.isFetchedSuccessfully()) {
      emit(NewsFetchedSuccess(newsModelList: newsListResult.data!));
    } else {
      emit(NewsFetchFailure(errorMessage: newsListResult.error!.errorMessage));
    }
  }
}
