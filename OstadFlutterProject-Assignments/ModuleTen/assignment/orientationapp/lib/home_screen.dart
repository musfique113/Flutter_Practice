import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Orientation'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? buildPortraitLayout()
              : buildLandscapeLayout();
        },
      ),
    );
  }

  Widget buildPortraitLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/53111065?v=4'),
        ),
        SizedBox(height: 10),
        Text(
          'Mahfujur R. Musfique',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Expanded(
          child: buildImageGridView(),
        ),
      ],
    );
  }

  Widget buildLandscapeLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/53111065?v=4'),
              ),
              SizedBox(height: 10),
              Text(
                'Mahfujur R. Musfique',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Dummy discription .',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
          child: buildImageGridView(),
        ),
      ],
    );
  }

  Widget buildImageGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(9, (index) {
        return Padding(
          padding: EdgeInsets.all(8.0), // Add spacing around each image
          child: Image.network(
            'https://avatars.githubusercontent.com/u/53111065?v=4',
            fit: BoxFit.cover,
          ),
        );
      }),
    );
  }

}
