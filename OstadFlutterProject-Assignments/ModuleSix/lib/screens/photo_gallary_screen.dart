import 'package:flutter/material.dart';

class PhotoGalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Welcome to My Photo Gallery!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Search for photos',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)
                  )
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(9, (index) {
                  return InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Clicked on photo!')),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Image.network(
                            'https://64.media.tumblr.com/f1ab4a3e52dd7aa76847c37ea39311da/4c684219b016b58e-95/s400x600/86b0d442017843887c47dc462f754f7e10d9256d.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text('Caption $index'),
                      ],
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20,),
            ListView(
              shrinkWrap: true,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network('https://64.media.tumblr.com/f1ab4a3e52dd7aa76847c37ea39311da/4c684219b016b58e-95/s400x600/86b0d442017843887c47dc462f754f7e10d9256d.png',
                      fit: BoxFit.fitHeight,),
                      title: Text('Photo Title $index'),
                      subtitle: Text('Photo Subtitle $index'),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.cloud_upload,
        color: Colors.redAccent,
        size:35 ,),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Photos Uploaded Successfully!'),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPhotoButton(
      BuildContext context, String imageUrl, String caption) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Clicked on photo!'),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            imageUrl,
            height: 120.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            child: Text(
              caption,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
