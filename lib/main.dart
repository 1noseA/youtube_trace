import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'キャロットケーキ日記'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Video> videos = List.generate(5, (index) => Video(
    title: 'おすすめキャロットケーキ5選',
    viewsAndDate: 'X.X万回再生・X日前',
    imageUrl: 'https://sozaino.site/wp-content/uploads/2021/09/lunch50.png',
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'YouTube',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Image.network(
                'https://sozaino.site/wp-content/uploads/2022/02/ninjin-37.png',
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 100,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'キャロットケーキ日記',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '@carrotcakediary',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'チャンネル登録者数 X.XX万人',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {}, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications),
                    Text('登録済み'),
                  ],
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: videos.length,
              itemBuilder: (context, index) {
                return VideoCard(
                  title: videos[index].title,
                  viewsAndDate: videos[index].viewsAndDate,
                  imageUrl: videos[index].imageUrl,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Video {
  final String title;
  final String viewsAndDate;
  final String imageUrl;

  Video({
    required this.title,
    required this.viewsAndDate,
    required this.imageUrl,
  });
}

class VideoCard extends StatelessWidget {
  final String title;
  final String viewsAndDate;
  final String imageUrl;

  const VideoCard({
    super.key, // ここを修正
    required this.title,
    required this.viewsAndDate,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 140,
          height: 100,
          child: Image.network(imageUrl),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                viewsAndDate,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
