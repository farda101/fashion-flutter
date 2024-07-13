import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Woman extends StatefulWidget {
  const Woman({super.key});

  @override
  State<Woman> createState() => _WomanState();
}

class _WomanState extends State<Woman> {
  int _currentIndex = 0;
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _cameraController = CameraController(
        _cameras![0],
        ResolutionPreset.high,
      );
      await _cameraController?.initialize();
      setState(() {});
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 1) {
        Navigator.pushReplacementNamed(context, '/profile');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xFFFFC6AC),
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 40,
              height: 40,
            ),
            SizedBox(width: 8),
            Text(
              'Fashion Lens',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          _currentIndex == 0
              ? (_cameraController != null &&
                      _cameraController!.value.isInitialized
                  ? CameraPreview(_cameraController!)
                  : Center(child: CircularProgressIndicator()))
              : Container(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        '1.png',
                        '2.png',
                        '3.png',
                        '4.png',
                        '5.png',
                        '6.png'
                      ].map((imageName) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            width: 100,
                            height: 145,
                            color: Color.fromARGB(255, 251, 207,
                                187), // Adjust the color as needed
                            child: Image.asset(
                              'assets/woman/woman_jackets/$imageName',
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      'jacket.png',
                      'dress.png',
                      'jeans.png',
                      'skirt.png',
                      'blouse.png'
                    ].map((imageName) {
                      return CircleAvatar(
                        radius: 20, // Reduced the size
                        backgroundColor: Color.fromARGB(
                            255, 251, 207, 187), // Adjust the color as needed
                        child: Image.asset(
                          'assets/woman/$imageName',
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
