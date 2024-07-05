import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'package:jitsivideoccall/Meeting.dart';
import 'package:jitsivideoccall/NotebookPaper.dart';

import 'SearchScreen.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool? isAudioOnly = true;
  bool? isAudioMuted = true;
  bool? isVideoMuted = true;

  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin: _onConferenceWillJoin,
        onConferenceJoined: _onConferenceJoined,
        onConferenceTerminated: _onConferenceTerminated,
        onError: _onError));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start  ,
        children: [
          Expanded(
            flex: 2,
            child: Meeting()
          ),
          const SizedBox(width: 40),
          Expanded(
            flex: 1,
            child: Container(
              height: 400,
              padding: const EdgeInsets.all(16.0),
              child: const NotebookPaper(
                entireText: [
                  'Hello, Notebook Paper!',
                  'This is line 1',
                  'This is line 2',
                  'This is line 3',
                  'This is line 4',
                ],
                title: 'My Notebook',
                fontSize: 20.0,
                rowHeight: 1.0,
                width: 0.8,
                paperColor: Color.fromARGB(255, 253, 248, 184),
                horizontalLinesColor: Colors.blue,
                verticalLinesColor: Colors.pink,
                pageTitle: true,
              ),
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            flex: 1,
            child: SearchScreen(),
          ),
        ],
      ),
    );
  }

  void _onAudioOnlyChanged(bool? value) {
    setState(() {
      isAudioOnly = value;
    });
  }

  void _onAudioMutedChanged(bool? value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  void _onVideoMutedChanged(bool? value) {
    setState(() {
      isVideoMuted = value;
    });
  }

  Future<void> _joinMeeting() async {
    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };

    var options = JitsiMeetingOptions(room: "myroom")
      ..serverURL = "serverUrl"
      ..subject = "myRoom"
      ..userDisplayName = "myRoom"
      ..userEmail = "myRoom"
      ..audioOnly = true
      ..audioMuted = true
      ..videoMuted = true
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": "myroom",
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": "myRoom"}
      };

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
        onConferenceWillJoin: (message) {
          debugPrint("${options.room} will join with message: $message");
        },
        onConferenceJoined: (message) {
          debugPrint("${options.room} joined with message: $message");
        },
        onConferenceTerminated: (message) {
          debugPrint("${options.room} terminated with message: $message");
        },
        genericListeners: [
          JitsiGenericListener(
            eventName: 'readyToClose',
            callback: (dynamic message) {
              debugPrint("readyToClose callback");
            },
          ),
        ],
      ),
    );
  }

  void _onConferenceWillJoin(message) {
    debugPrint("_onConferenceWillJoin broadcasted with message: $message");
  }

  void _onConferenceJoined(message) {
    debugPrint("_onConferenceJoined broadcasted with message: $message");
  }

  void _onConferenceTerminated(message) {
    debugPrint("_onConferenceTerminated broadcasted with message: $message");
  }

  void _onError(error) {
    debugPrint("_onError broadcasted: $error");
  }
}
