import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package
import 'model.dart';

class Detail extends StatelessWidget {
  final ReadingLogEntries? readingLogEntry;

  Detail({required this.readingLogEntry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Buku'),
        backgroundColor: Colors.brown[500],
      ),
      backgroundColor: Colors.brown[300],
      body: Padding(
        padding: const EdgeInsets.all(16.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://covers.openlibrary.org/b/id/${readingLogEntry?.work?.coverId}-M.jpg',
            ),
            SizedBox(height: 20),
            Text(
              '${readingLogEntry?.work?.title ?? 'Unknown'}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Nama Author : ${readingLogEntry?.work?.authorNames?.join(', ') ?? 'Unknown'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Tahun Pembuatan : ${readingLogEntry?.work?.firstPublishYear ?? 'Unknown'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Tanggal Dicatat : ${readingLogEntry?.loggedDate ?? 'Unknown'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Link baca :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                _launchURL(
                  'https://openlibrary.org/${readingLogEntry?.work?.key}/${readingLogEntry?.work?.title}',
                );
              },
              child: Text(
                'https://openlibrary.org${readingLogEntry?.work?.key}/${readingLogEntry?.work?.title}',
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
