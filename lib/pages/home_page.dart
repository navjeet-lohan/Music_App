import 'package:flutter/material.dart';
import 'package:music_app/pages/song_page.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../models/playlist_provider.dart';
import '../models/song.dart';
    class HomePage extends StatefulWidget {
      const HomePage({super.key});



      @override
      State<HomePage> createState() => _HomePageState();
    }
    
    class _HomePageState extends State<HomePage> {


      //get the playlist provider
      late final dynamic playlistProvider;
      @override
void initState(){
        super.initState();

        //get playlist provider
        playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
      }
//go to a song
      void goToSong(int songIndex){
        //update current song Index
        playlistProvider.currentSongIndex = songIndex;

        //navigate to song Page
        Navigator.push(
          context,MaterialPageRoute(builder: (context)=>songPage()),
        );
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(

          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
              title: const Text("M Y   M U S I C")),
          drawer: const MyDrawer(),
          body: Consumer<PlaylistProvider>(

            builder: (context, value, child){
              //get the playlist
              final List<Song> playlist = value.playlist;
              //return listview UI
              return ListView.builder(
                itemCount : playlist.length,
                itemBuilder: (context,index) {
                  //get individual song
                  final Song song  = playlist[index];
                  //return list tile UI
                 return  ListTile(
                   title: Text(song.songName),
                   subtitle: Text(song.artistName),
                   leading: Image.asset(song.albumArtImagePath),
                   onTap: ()=>goToSong(index),
                 );
                },
              );
            },
          ),
        );
      }
    }
    