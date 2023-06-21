import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Me extends StatelessWidget {
  final String portfolioLink = 'bhanuprakash9973.github.io';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome to My App!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Visit My Portfolio:',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () => _openPortfolioLink(),
              child: Text(
                portfolioLink,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => _openPortfolioLink(),
              child: const Text('Open Portfolio'),
            ),
          ],
        ),
      ),
    );
  }

  void _openPortfolioLink() async {
    final url = 'https://$portfolioLink';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
