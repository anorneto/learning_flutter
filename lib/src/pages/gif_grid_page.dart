import 'package:flutter/material.dart';
import '../widgets/gif_grid.dart';
import '../utils/gif_functions.dart';

class GifGridPage extends StatefulWidget {
  GifGridPage({Key key}) : super(key: key);

  _GifGridPageState createState() => _GifGridPageState();
}

class _GifGridPageState extends State<GifGridPage> {
  Future<Map> _gifsUrl;
  String _search = '';
  int _offset = 0;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    _gifsUrl = getGifsList(
        _search, _offset); // start for the first time with the trending widgets
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            'https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif'),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search Here!!',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                textAlign: TextAlign.center,
                controller: controller,
                onSubmitted: (inputText) {
                  setState(() {
                    _search = inputText;
                    _offset = 0;
                    _gifsUrl = getGifsList(_search, _offset);
                  });
                }),
          ),
          GifGrid(
            gifsUrl: _gifsUrl,
            loadMoreGifs: loadMoreGifs,
          ), // constructs the GifGrid widget, passes a function to be called on this widget
        ],
      ),
    );
  }

  loadMoreGifs() {
    setState(() {
      _offset += 25;
      _gifsUrl = getGifsList(_search, _offset);
    });
  }

}
