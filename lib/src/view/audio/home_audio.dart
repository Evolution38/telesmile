//ignore_for_file: must_be_immutable, avoid_print;

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:telesmile/src/view/widgets/widgets.dart';
import 'package:rxdart/rxdart.dart';

import 'audio_player_buttons.dart';

class HomeAudioPage extends StatefulWidget {
  List<AudioSource> audioList = [];

  HomeAudioPage(this.audioList, {Key? key}) : super(key: key);

  @override
  _HomeAudioPageState createState() => _HomeAudioPageState();
}

class _HomeAudioPageState extends State<HomeAudioPage> {
  AudioPlayer? _audioPlayer;
  late Stream<DurationState> _durationState;
  // List<AudioSource> audioList = [
  //   AudioSource.uri(Uri.parse(""))
  // ];
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _durationState = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
        _audioPlayer!.positionStream,
        _audioPlayer!.playbackEventStream,
        (position, playbackEvent) => DurationState(
              progress: position,
              buffered: playbackEvent.bufferedPosition,
              total: playbackEvent.duration,
            ));
    _audioPlayer!
        .setAudioSource(ConcatenatingAudioSource(children: widget.audioList));
  }

  @override
  void dispose() {
    _audioPlayer!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header('Audio'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Image(
            image: AssetImage(
              'assets/Group 21.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _progressBar(),
          ),
          PlayerButtons(_audioPlayer!)
        ],
      ),
    );
  }

  StreamBuilder<DurationState> _progressBar() {
    return StreamBuilder<DurationState>(
      stream: _durationState,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: progress,
          buffered: buffered,
          total: total,
          onSeek: (duration) {
            _audioPlayer!.seek(duration);
          },
          onDragUpdate: (details) {
            debugPrint('${details.timeStamp}, ${details.localPosition}');
          },
        );
      },
    );
  }
}

class DurationState {
  const DurationState({
    required this.progress,
    required this.buffered,
    this.total,
  });
  final Duration progress;
  final Duration buffered;
  final Duration? total;
}