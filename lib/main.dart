import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_list/features/todos/controllers/todos_controller.dart';

import 'package:provider_todo_list/features/todos/pages/todos_page.dart';
import 'package:provider_todo_list/shared/services/local_storage/local_storage_service.dart';
import 'package:provider_todo_list/shared/services/local_storage/todos_local_storage_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodosController(
        TodosLocalStorageService(
          LocalStorageService(),
        ),
      ),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.blue,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        home: const TodosPage(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
      ),
    );
  }
}
