import 'package:first_app/src/pages/single_gif_page.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class GifGrid extends StatelessWidget {
  final Future<Map> gifsUrl;
  final Function() loadMoreGifs;

  GifGrid({@required this.gifsUrl, @required this.loadMoreGifs});

  @override
  Widget build(BuildContext context) {
    return Expanded( // expands into the main axis
      child: FutureBuilder(
          future: this.gifsUrl,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Container(
                  width: 200.0,
                  height: 200.0,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 5.0,
                  ),
                );
              default:
                if (snapshot.hasError)
                  return Container();
                else
                  return _createGifTable(context, snapshot);
            }
          }),
    );
  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: snapshot.data['data'].length + 1,
      itemBuilder: (context, index) {
        if (index < snapshot.data['data'].length)
          return GestureDetector(
            // allows me to click on the image
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image : snapshot.data['data'][index]['images']['fixed_height']['url'],
              height: 300.0,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SingleGifPage(snapshot.data['data'][index])));
            },
            onLongPress: (){
              Share.share(snapshot.data['data'][index]['images']['fixed_height']['url']);
            },
          );
        else
          return Container(
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add, color: Colors.white, size: 71.0),
                  Text(
                    'Load More...',
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  )
                ],
              ),
              onTap: loadMoreGifs, // calls function on parent widget
            ),
          );
      },
    );
  }
}
