import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'gif_grid_page.dart';
import '../utils/gif_functions.dart';

class HomeGifPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        //width: MediaQuery.of(context).size.width, // Another way of getting the screen full width
        width: double.infinity,
        //height: MediaQuery.of(context).size.height, // Another way of getting the screen full height
        height: double.infinity,
        child: FutureBuilder(
            future: getSingleRandomGif('wow'),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return Container(
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
                    return FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: snapshot.data['data']['images']['original']['url'],
                      fit: BoxFit.cover,
                    );
              }
            }),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             SizedBox(
                width: 250.0,
                height: 150.0,
                child: RaisedButton(
                  shape: CircleBorder(),
                  color: Colors.black.withOpacity(0.3),
                  textColor: Colors.white,

                  onPressed: () {
                    //button press navigates to app.dart
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GifGridPage()));
                  },
                  child: Text(
                    'Click Me!',
                    style: TextStyle(
                      fontSize: 35.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
