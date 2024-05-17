import 'package:bloc_news_app/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:bloc_news_app/features/daily_news/presentation/bloc/remote/remote_article_state.dart';
import 'package:bloc_news_app/features/daily_news/presentation/widgets/article_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Daily News'),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        if (state is RemoteArticleLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (state is RemoteArticleError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }

        if (state is RemoteArticleLoaded) {
          return ListView.builder(
            itemCount: state.articles?.length,
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: state.articles![index],
              );
            },
          );
        }

        return const SizedBox(
          child: Text('data nai...'),
        );
      },
    );
  }
}
