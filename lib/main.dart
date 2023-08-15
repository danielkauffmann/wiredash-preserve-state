import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wiredash/wiredash.dart';
import 'package:wiredash_preserve_state/example_bloc/example_bloc.dart';
import 'package:wiredash_preserve_state/router.dart';

import 'bloc_observer.dart';

Future<void> main() async {
  Bloc.observer = ExampleBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wiredash(
      projectId: 'YOUR_PROJECT_ID',
      secret: 'YOUR_SECRET',
      child: RouterWidget(),
    );
  }
}

class RouterWidget extends StatefulWidget {
  const RouterWidget({super.key});

  @override
  State<RouterWidget> createState() => _RouterWidgetState();
}

class _RouterWidgetState extends State<RouterWidget> {
  final autoRoute = AppRouter();
  final goRouter = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AutoRoute preserve state with Wiredash demo',
      routerConfig: autoRoute.config(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

@RoutePage()
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExampleBloc>(
      lazy: false,
      create: (context) => ExampleBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Wiredash preserve state demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: Wiredash.of(context).show,
                child: const Text('Show Wiredash'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
