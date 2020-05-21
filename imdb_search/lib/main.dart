import 'package:flutter/material.dart';
import './component/movie_list.dart';
import './screens/movie_detail.dart';
import './service/movie_service.dart';
import './model/movie.dart';
import 'package:flutter/services.dart';


class MoviesAppHome extends StatefulWidget {
  @override
  MoviesAppHomeState createState() => MoviesAppHomeState();
  
}

class MoviesAppHomeState extends State<MoviesAppHome> {
  //A controller is required to get the value of the textfield
  final searchTextController = new TextEditingController();
  String searchText = "";

  @override
  void dispose() {
    //Dispose the controller when the screen is disposed 
    searchTextController.dispose();
    super.dispose();
  }

  //When a movie is clicked navigate to the movie detail screen
  void itemClick(Movie item) {
    //The movie details will be passed via the list
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MovieDetail(
                movieName: item.title,
                imdbId: item.imdbID,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Search Movies')),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Row(children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: searchTextController, 
                    decoration:InputDecoration(hintText: 'Enter a search term'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  tooltip: 'Search Movies',
                  onPressed: () {
                    setState(() {
                      //Set the state with the new value so that the widget will re render
                      searchText = searchTextController.text;
                      //Hide keyboard when the state is set
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                    });
                  },
                ),
              ]),
              padding: EdgeInsets.all(10),
            ),
            //Only send the service request if the keyword is not empty
            if (searchText.length > 0)
            //A future builder to render the 
              FutureBuilder<List<Movie>>(
                  //Initiate the service request 
                  future: searchMovies(searchText),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //if the response has data render the movie list
                      return Expanded(
                        child: MovieList(movies: snapshot.data, itemClick: this.itemClick)
                      );
                    } else if (snapshot.hasError) {
                      //if there is an error show the error message
                      return Text("${snapshot.error}");
                    }
                    //if the service call is in progress show the progress indicator
                    return CircularProgressIndicator();
                  }),
          ],
        ));
  }
}