import 'package:bloc_news_app/config/theme/app_theme.dart';
import 'package:bloc_news_app/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:bloc_news_app/features/daily_news/presentation/bloc/remote/remote_article_event.dart';
import 'package:bloc_news_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:bloc_news_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl<RemoteArticleBloc>()..add(const FetchArticles()),
      child: MaterialApp(
        theme: appTheme(),
        home: const DailyNews(),
      ),
    );
  }
}
