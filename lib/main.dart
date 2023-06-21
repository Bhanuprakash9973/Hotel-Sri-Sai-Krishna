import 'package:flutter/material.dart';

import './me.dart';
import 'calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bill Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/calculator': (context) => CalculatorPage(),
        '/me': (context) => Me(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageItem {
  final IconData icon;
  final String title;
  final String route;

  PageItem({
    required this.icon,
    required this.title,
    required this.route,
  });
}

class HomePage extends StatelessWidget {
  final List<PageItem> pages = [
    PageItem(
      icon: Icons.person_2,
      title: 'About Me',
      route: '/me',
    ),
    PageItem(
      icon: Icons.calculate,
      title: 'Calculator',
      route: '/calculator',
    ),
    // Add more PageItems for each available page
  ];

  @override
  Widget build(BuildContext context) {
    // double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text("Hotel Sri Sai Krishna")),
      ),
      body: ListView.builder(
        itemCount: pages.length,
        itemBuilder: (context, index) {
          final page = pages[index];
          return SizedBox(
            height: 0.3 * screenheight,
            child: Card(
              color: const Color.fromRGBO(225, 225, 225, 0.9),
              elevation: 8,
              child: ListTile(
                leading: Icon(page.icon),
                title: Text(page.title),
                onTap: () {
                  Navigator.pushNamed(context, page.route);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
