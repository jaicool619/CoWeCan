
import 'package:CoWeCan/excersie/exercisePlaylist.dart';
import 'package:CoWeCan/excersie/exercisePlaylistCard.dart';
import 'package:CoWeCan/screens/home/exercise_model.dart';
import 'package:flutter/material.dart';


class Exercise extends StatefulWidget {
    final List<ExercisePlaylist> playlist;
    final String background;
    final int asset ;

  const Exercise({this.playlist, this.background, this.asset});
    
  @override
  _ExerciseState createState() => _ExerciseState();

}
class _ExerciseState extends State<Exercise> {

    
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: SafeArea(
              child: Container(height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(    image: DecorationImage(
            image: widget.asset == 1?AssetImage(
              widget.background,
            ):NetworkImage(widget.background),
            fit: BoxFit.cover
            // alignment: Alignment.bottomCenter
                        )
                      ),
            
          child: PageView.builder(
            itemCount: widget.playlist.length,
              controller: PageController(viewportFraction: 0.8),
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              itemBuilder: (context, position){
            ExercisePlaylist playlist = widget.playlist.elementAt(position);
                return Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ExercisePlaylistScreen(
                        exercisePlaylist: playlist,
                      )
                      )
                      ),
                      child: ExercisePlaylistCard(
                      exercisePlaylist: playlist,
                      cardNum: position,
                    ),
                  )
                );
              },
              
            ),
        ),
      )
        );
  }
}