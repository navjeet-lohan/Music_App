import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class PlaylistProvider extends ChangeNotifier{
  //playlist of songs
  final List<Song> _playlist = [
    //song1
    Song(songName: "Dooriyan",
        artistName: "Dakufy",
        albumArtImagePath: "assets/images/Dooriyan.jpg",
        audioPath: "audio/Dooriyan.mp3",
    ),
    //song2
    Song(songName: "Dil Ki Awaaz",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Dil Ki Awaaz.jpg",
      audioPath: "audio/DilKiAwaaz.mp3",
    ),
    //song3
    Song(songName: "Khoyi Hoon",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Khoyi Hoon.jpg",
      audioPath: "audio/Khoyi Hoon.mp3",
    ),

    //song4
    Song(songName: "Khud",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Khud.jpg",
      audioPath: "audio/Khud.mp3",
    ),
    //song5
    Song(songName: "Mera Dil",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Mera Dil.jpg",
      audioPath: "audio/Mera Dil.mp3",
    ),
    //song6
    Song(songName: "Pyar Ka Asar",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Pyar Ka Asar.jpg",
      audioPath: "audio/Pyar Ka Asar.mp3",
    ),
    //song7
    Song(songName: "Mohobbat Ki Dhund",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Mohobbat Ki Dhund.jpg",
      audioPath: "audio/Mohobbat Ki Dhund.mp3",
    ),
    //song8
    Song(songName: "Sun Le",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Sun Le.jpg",
      audioPath: "audio/Sun Le.mp3",
    ),
    //song9
    Song(songName: "Chhahat Meri",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Chahat Meri.jpg",
      audioPath: "audio/Chhahat Meri.mp3",
    ),
    //song10
    Song(songName: "Veeran",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Veeraan.jpg",
      audioPath: "audio/Veeran.mp3",
    ),

    //song11
    Song(songName: "Sazza",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Sazza.jpg",
      audioPath: "audio/Sazza.mp3",
    ),
    //song12
    Song(songName: "Khoj",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Khoj.jpg",
      audioPath: "audio/Khoj.mp3",
    ),
    //song13
    Song(songName: "Kadam",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Kadam.jpg",
      audioPath: "audio/Kadam.mp3",
    ),
  //song14
  Song(songName: "Jab Tu Hai Saath",
  artistName: "Dakufy",
  albumArtImagePath: "assets/images/Jab Tu Hai Saath.jpg",
  audioPath: "audio/Jab Tu Hai Saath.mp3",
    ),
  //song15
  Song(songName: "Adhoori Yaadein",
  artistName: "Dakufy",
  albumArtImagePath: "assets/images/Adhoori Yaadein.jpg",
  audioPath: "audio/Adhoori Yaadein.mp3",
  ),
    //song16
    Song(songName: "Raaz Mera",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Raaz Mera.jpg",
      audioPath: "audio/Raaz Mera.mp3",
    ),

    //song17
    Song(songName: "Hum Chale",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Hum Chale.jpg",
      audioPath: "audio/Hum Chale.mp3",
    ),
    //song18
    Song(songName: "Silsila Humara",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Silsila Humara.jpg",
      audioPath: "audio/Silsila Humara.mp3",
    ),
    //song19
    Song(songName: "Tu Hi",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Tu Hi.jpg",
      audioPath: "audio/Tu Hi.mp3",
    ),

    //song20
    Song(songName: "Pyaar Ka Safar",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Pyar Ka Safar.jpg",
      audioPath: "audio/Pyaar Ka Safar.mp3",
    ),
    //song21
    Song(songName: "Woh Banda",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Woh Banda.jpg",
      audioPath: "audio/Woh Banda.mp3",
    ),
    //song22
    Song(songName: "Mera Junoon",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Mera Junoon.jpg",
      audioPath: "audio/Mera Junoon.mp3",
    ),
    //song23
    Song(songName: "Ankahi Battein",
      artistName: "Dakufy",
      albumArtImagePath: "assets/images/Ankahi Baatein.jpg",
      audioPath: "audio/Ankahi Battein.mp3",
    ),



  ];

  //current song playing index

  int? _currentSongIndex;

  /*

  A U D I O  P L A Y E R

   */
  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  //durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructor
PlaylistProvider(){
  listenToDuration();
}

  //initially not playing
  bool _isPlaying = false;


  //play the song
void play() async{
  final String path = _playlist[_currentSongIndex!].audioPath;
  await _audioPlayer.stop();
  await _audioPlayer.play(AssetSource(path)); //play the new song
  _isPlaying = true;
  notifyListeners();
  }

  //pause the song
  void pause() async{
  await _audioPlayer.pause();
  _isPlaying = false;
  notifyListeners();
  }


  //resume the song
  void resume() async{
  await _audioPlayer.resume();
  _isPlaying =true;
  notifyListeners();
  }

  //pause or resume
  void pauseOrResume() async{
    if (_isPlaying){
      pause();
    } else{
      resume();
    }
    notifyListeners();

  }

  //seek to a specific duration in the current song
  void seek(Duration position) async{
  await _audioPlayer.seek(position);
  }


  //play next song
  void playNextSong(){
  if(currentSongIndex !=null){
    if(currentSongIndex !< _playlist.length-1){
      currentSongIndex  = _currentSongIndex! +1;
    }else{
      currentSongIndex = 0;

    }
  }
  }

  //play previous song
void playPreviousSong() async{
    if (_currentDuration.inSeconds > 2){
      seek(Duration.zero);
// restart the current song
    } else{
      if(_currentSongIndex !> 0 ){
        currentSongIndex =_currentSongIndex!-1;
      } else{
        currentSongIndex =_playlist.length-1;
      }
    }
}

  //list to duration
  void listenToDuration(){
  //listen for total duration
  _audioPlayer.onDurationChanged.listen((newDuration) {
    _totalDuration = newDuration;
    notifyListeners();


    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
//listen for song completion
    _audioPlayer.onPlayerComplete.listen((event){
playNextSong();
    });

    });
  });

  }

  //dispose audio player

  /*

          G E T T E R S

   */
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying =>  _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;



/*

          S E T T E R S

   */

set currentSongIndex(int? newIndex){
  //update current song Index
  _currentSongIndex = newIndex;
  if(newIndex != null){
    play();
    //play the song at new index
  }
  //update UI
  notifyListeners();
}



}