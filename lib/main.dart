import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/app_routes.dart';
import 'config/theme/app_theme.dart';
import 'features/daily_news/presentation/bloc/local/local_article_bloc.dart';
import 'features/daily_news/presentation/bloc/local/local_article_event.dart';
import 'features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'features/daily_news/presentation/bloc/remote/remote_article_event.dart';
import 'injection_container.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteArticleBloc>(
          create: (context) => sl<RemoteArticleBloc>()..add(const FetchArticlesEvent()),
        ),
        BlocProvider<LocalArticleBloc>(
          create: (context) => sl<LocalArticleBloc>()..add(const GetSavedArticlesEvent()),
        ),
      ],
      child: MaterialApp(
        theme: appTheme(),
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
