import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final String apiKey = "81b94877b8da450daebd0b6aba4e06a5"; // Your API key
  List articles = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      // Use 'q' parameter to search for Gwalior-related news
      String url =
          "https://newsapi.org/v2/everything?q=Gwalior&apiKey=$apiKey";

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          articles = data['articles'];
        });
      } else {
        throw Exception("Failed to fetch news");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(width: 10),
            Text(
              'Gwalior News',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.teal,
        elevation: 10,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.teal, Colors.cyan],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: articles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: article['urlToImage'] != null
                  ? Image.network(article['urlToImage'],
                  width: 100, fit: BoxFit.cover)
                  : Icon(Icons.image_not_supported),
              title: Text(article['title'] ?? "No Title"),
              subtitle: Text(article['description'] ?? "No Description"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailPage(article: article),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class NewsDetailPage extends StatelessWidget {
  final Map article;

  NewsDetailPage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article['source']['name'] ?? "News Source"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article['urlToImage'] != null)
              Image.network(article['urlToImage']),
            SizedBox(height: 10),
            Text(
              article['title'] ?? "No Title",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              article['content'] ?? "No Content",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
