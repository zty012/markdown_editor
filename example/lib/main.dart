import 'package:flutter/material.dart';
import 'package:markdown_editor_plus/markdown_editor_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MarkdownFormField(
            controller: _controller,
            emojiConvert: true,
            autoCloseAfterSelectEmoji: false,
            // maxLines: 10,
            // minLines: 1,
            // expands: true,
            onChanged: (s) {
              setState(() {});
            },
          ),
          SizedBox(
            height: 100,
            child: MarkdownParse(
              data: _controller.text,
              selectable: true,
              onTapHastag: (String name, String match) {
                // example : #hashtag
                // name => hashtag
                // match => #hashtag
              },
              onTapMention: (String name, String match) {
                // example : @mention
                // name => mention
                // match => #mention
              },
            ),
          ),
        ],
      ),
    );
  }
}
