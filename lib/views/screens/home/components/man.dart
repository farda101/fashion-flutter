// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';

// class Man extends StatefulWidget {
//   const Man({super.key});

//   @override
//   State<Man> createState() => _ManState();
// }

// class _ManState extends State<Man> {
//   int _currentIndex = 0;
//   CameraController? _cameraController;
//   List<CameraDescription>? _cameras;
//   String _selectedCategory = 'jacket';

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     _cameras = await availableCameras();
//     if (_cameras != null && _cameras!.isNotEmpty) {
//       _cameraController = CameraController(
//         _cameras![0],
//         ResolutionPreset.high,
//       );
//       await _cameraController?.initialize();
//       setState(() {});
//     }
//   }

//   @override
//   void dispose() {
//     _cameraController?.dispose();
//     super.dispose();
//   }

//   void _onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//       if (index == 1) {
//         Navigator.pushReplacementNamed(context, '/profile');
//       }
//     });
//   }

//   void _onCategorySelected(String category) {
//     setState(() {
//       _selectedCategory = category;
//     });
//   }

//   List<String> _getImageList() {
//     switch (_selectedCategory) {
//       case 'jacket':
//         return [
//           'assets/man/man_jackets/male_jacket_1.png',
//           'assets/man/man_jackets/male_jacket_2.png',
//           'assets/man/man_jackets/male_jacket_3.png',
//           'assets/man/man_jackets/male_jacket_4.png',
//           'assets/man/man_jackets/male_jacket_5.png',
//           'assets/man/man_jackets/male_jacket_6.png'
//         ];
//       case 'shortpants':
//         return [
//           'assets/man/man_shortpants/male_short_1.png',
//           'assets/man/man_shortpants/male_short_2.png',
//           'assets/man/man_shortpants/male_short_3.png',
//           'assets/man/man_shortpants/male_short_4.png',
//           'assets/man/man_shortpants/male_short_5.png',
//           'assets/man/man_shortpants/male_short_6.png'
//         ];
//       case 'longpants':
//         return [
//           'assets/man/man_longpants/male_pants_1.png',
//           'assets/man/man_longpants/male_pants_2.png',
//           'assets/man/man_longpants/male_pants_3.png',
//           'assets/man/man_longpants/male_pants_4.png',
//           'assets/man/man_longpants/male_pants_5.png',
//           'assets/man/man_longpants/male_pants_6.png'
//         ];
//       case 'sweater':
//         return [
//           'assets/man/man_sweater/male_sweatshirt_1.png',
//           'assets/man/man_sweater/male_sweatshirt_2.png',
//           'assets/man/man_sweater/male_sweatshirt_3.png',
//           'assets/man/man_sweater/male_sweatshirt_4.png',
//           'assets/man/man_sweater/male_sweatshirt_5.png',
//           'assets/man/man_sweater/male_sweatshirt_6.png'
//         ];
//       case 'shirt':
//         return [
//           'assets/man/man_shirt/male_tshirt_1.png',
//           'assets/man/man_shirt/male_tshirt_2.png',
//           'assets/man/man_shirt/male_tshirt_3.png',
//           'assets/man/man_shirt/male_tshirt_4.png',
//           'assets/man/man_shirt/male_tshirt_5.png',
//           'assets/man/man_shirt/male_tshirt_6.png'
//         ];
//       default:
//         return [
//           'assets/man/man_jackets/male_jacket_1.png',
//           'assets/man/man_jackets/male_jacket_2.png',
//           'assets/man/man_jackets/male_jacket_3.png',
//           'assets/man/man_jackets/male_jacket_4.png',
//           'assets/man/man_jackets/male_jacket_5.png',
//           'assets/man/man_jackets/male_jacket_6.png'
//         ];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         backgroundColor: Color(0xFFFFC6AC),
//         title: Row(
//           children: [
//             Image.asset(
//               'assets/logo.png',
//               width: 40,
//               height: 40,
//             ),
//             SizedBox(width: 8),
//             Text(
//               'Fashion Lens',
//               style: TextStyle(
//                 fontFamily: 'Roboto',
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Stack(
//         children: [
//           _currentIndex == 0
//               ? (_cameraController != null &&
//                       _cameraController!.value.isInitialized
//                   ? CameraPreview(_cameraController!)
//                   : Center(child: CircularProgressIndicator()))
//               : Container(),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: _getImageList().map((imageName) {
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                           child: Container(
//                             width: 100,
//                             height: 145,
//                             color: Color.fromARGB(255, 251, 207, 187), // Adjust the color as needed
//                             child: Image.asset(
//                               imageName,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       'jacket',
//                       'shortpants',
//                       'longpants',
//                       'sweater',
//                       'shirt'
//                     ].map((category) {
//                       return GestureDetector(
//                         onTap: () => _onCategorySelected(category),
//                         child: CircleAvatar(
//                           radius: 20, // Reduced the size
//                           backgroundColor: Color.fromARGB(255, 251, 207, 187), // Adjust the color as needed
//                           child: Image.asset(
//                             'assets/man/$category.png',
//                             width: 30,
//                             height: 30,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Man extends StatefulWidget {
  const Man({super.key});

  @override
  State<Man> createState() => _ManState();
}

class _ManState extends State<Man> {
  int _currentIndex = 0;
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;
  String _selectedCategory = 'jacket';

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

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  List<String> _getImageList() {
    switch (_selectedCategory) {
      case 'jacket':
        return [
          'assets/man/man_jackets/male_jacket_1.png',
          'assets/man/man_jackets/male_jacket_2.png',
          'assets/man/man_jackets/male_jacket_3.png',
          'assets/man/man_jackets/male_jacket_4.png',
          'assets/man/man_jackets/male_jacket_5.png',
          'assets/man/man_jackets/male_jacket_6.png'
        ];
      case 'shortpants':
        return [
          'assets/man/man_shortpants/male_short_1.png',
          'assets/man/man_shortpants/male_short_2.png',
          'assets/man/man_shortpants/male_short_3.png',
          'assets/man/man_shortpants/male_short_4.png',
          'assets/man/man_shortpants/male_short_5.png',
          'assets/man/man_shortpants/male_short_6.png'
        ];
      case 'longpants':
        return [
          'assets/man/man_longpants/male_pants_1.png',
          'assets/man/man_longpants/male_pants_2.png',
          'assets/man/man_longpants/male_pants_3.png',
          'assets/man/man_longpants/male_pants_4.png',
          'assets/man/man_longpants/male_pants_5.png',
          'assets/man/man_longpants/male_pants_6.png'
        ];
      case 'sweater':
        return [
          'assets/man/man_sweater/male_sweatshirt_1.png',
          'assets/man/man_sweater/male_sweatshirt_2.png',
          'assets/man/man_sweater/male_sweatshirt_3.png',
          'assets/man/man_sweater/male_sweatshirt_4.png',
          'assets/man/man_sweater/male_sweatshirt_5.png',
          'assets/man/man_sweater/male_sweatshirt_6.png'
        ];
      case 'shirt':
        return [
          'assets/man/man_shirt/male_tshirt_1.png',
          'assets/man/man_shirt/male_tshirt_2.png',
          'assets/man/man_shirt/male_tshirt_3.png',
          'assets/man/man_shirt/male_tshirt_4.png',
          'assets/man/man_shirt/male_tshirt_5.png',
          'assets/man/man_shirt/male_tshirt_6.png'
        ];
      default:
        return [
          'assets/man/man_jackets/male_jacket_1.png',
          'assets/man/man_jackets/male_jacket_2.png',
          'assets/man/man_jackets/male_jacket_3.png',
          'assets/man/man_jackets/male_jacket_4.png',
          'assets/man/man_jackets/male_jacket_5.png',
          'assets/man/man_jackets/male_jacket_6.png'
        ];
    }
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
                      children: _getImageList().map((imageName) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            width: 130, // Adjusted width
                            height: 130, // Adjusted height
                            color: Color.fromARGB(255, 251, 207, 187), // Adjust the color as needed
                            child: Image.asset(
                              imageName,
                              width: 130, // Adjusted width
                              height: 130,
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
                      'jacket',
                      'shortpants',
                      'longpants',
                      'sweater',
                      'shirt'
                    ].map((category) {
                      return GestureDetector(
                        onTap: () => _onCategorySelected(category),
                        child: CircleAvatar(
                          radius: 20, // Reduced the size
                          backgroundColor: Color.fromARGB(255, 251, 207, 187), // Adjust the color as needed
                          child: Image.asset(
                            'assets/man/$category.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
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
