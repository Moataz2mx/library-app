

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;
// // import 'package:flutter_application_1/information.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter_application_1/welcome.dart';
// import 'package:flutter_application_1/Add.dart';
// import 'package:flutter_application_1/search.dart';

// class HomePage extends StatefulWidget {
//   final String? username;
//   final String? email;
//   final File? profileImage; // Add profileImage as a parameter

//   const HomePage({
//     super.key,
//     required this.username,
//     required this.email,
//     this.profileImage, // Make it optional
//   });

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List element = [
//     {
//       "name": "Altarih",
//       "image": "assets/altarih.jpg",
//       "pdf": "assets/pdf/c.pdf"
//     },
//     {"name": "Fun", "image": "assets/fun.jpeg", "pdf": "assets/pdf/c.pdf"},
//     {"name": "Kill", "image": "assets/kill.jpeg", "pdf": "assets/pdf/c2.pdf"},
//   ];

//   Future<void> _navigateToAddPage() async {
//     final newElement = await Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const AddPage()),
//     );

//     if (newElement != null && newElement is Map<String, dynamic>) {
//       setState(() {
//         element.add(newElement);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final String displayName = widget.username ?? "Salem";
//     final String displayEmail = widget.email ?? "salem@gmail.com";

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Books",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: const Color(0xFFA45963),
//         actions: [
//           IconButton(
//             onPressed: () {
//               showSearch(
//                 context: context,
//                 delegate: ItemSearchDelegate(element),
//               );
//             },
//             icon: const Icon(Icons.search, color: Colors.white),
//           ),
//         ],
//       ),
//       drawer: Drawer(
//         shadowColor: Colors.white,
//         child: ListView(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               decoration: const BoxDecoration(
//                 color: Color(0xFFA45963),
//               ),
//               accountName: Text(
//                 displayName,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//               ),
//               accountEmail: Text(displayEmail),
//               currentAccountPicture: widget.profileImage != null
//                   ? CircleAvatar(
//                       backgroundImage: FileImage(widget.profileImage!),
//                     )
//                   : const CircleAvatar(
//                       backgroundImage: AssetImage("assets/p5.png"),
//                     ),
//             ),
//             // ListTile(
//             //   title: const Text("Login"),
//             //   leading: const Icon(Icons.login, color: Color(0xFFA45963)),
//             //   onTap: () {
//             //     Navigator.pushNamed(context, 'login');
//             //   },
//             // ),
//             // ListTile(
//             //   title: const Text("SignUp"),
//             //   leading: const Icon(Icons.group_add_outlined,
//             //       color: Color(0xFFA45963)),
//             //   onTap: () {
//             //     Navigator.pushNamed(context, 'signup');
//             //   },
//             // ),
//             ListTile(
//               title: const Text("Logout"),
//               leading:
//                   const Icon(Icons.logout_outlined, color: Color(0xFFA45963)),
//               onTap: () {
//                 Navigator.pushReplacement(context,
//                     MaterialPageRoute(builder: (context) => WelcomePage()));
//               },
//             ),
//           ],
//         ),
//       ),
//       // Rest of the body remains the same...
//       body: GridView.builder(
//         padding: const EdgeInsets.all(8.0),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 8,
//           crossAxisSpacing: 8,
//           childAspectRatio: 0.7,
//         ),
//         itemCount: element.length,
//         itemBuilder: (context, index) {
//           return Card(
//             elevation: 5,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       topLeft: Radius.circular(15),
//                       topRight: Radius.circular(15),
//                     ),
//                     child: element[index]['image'] != null
//                         ? (element[index]['image'].startsWith('assets/')
//                             ? Image.asset(
//                                 element[index]['image'],
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                               )
//                             : Image.file(
//                                 File(element[index]['image']),
//                                 fit: BoxFit.cover,
//                                 width: double.infinity,
//                               ))
//                         : const Icon(Icons.image, size: 50),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     element[index]['name'],
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     IconButton(
//                       onPressed: () async {
//                         var updatedValue = await Navigator.pushNamed(
//                           context,
//                           'Edit',
//                           arguments: element[index],
//                         );
//                         if (updatedValue != null &&
//                             updatedValue is Map<String, dynamic>) {
//                           setState(() {
//                             element[index] = updatedValue;
//                           });
//                         }
//                       },
//                       icon: const Icon(Icons.edit, color: Color(0xFFA45963)),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         setState(() {
//                           element.removeAt(index);
//                         });
//                       },
//                       icon: const Icon(Icons.delete, color: Colors.red),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: const Color(0xFFA45963),
//         onPressed: _navigateToAddPage,
//         child: const Icon(Icons.add, color: Colors.white),
//       ),
//     );
//   }
// }


// Future<String> copyAssetToTemp(String assetPath, String fileName) async {
//   final byteData = await rootBundle.load(assetPath);

//   final tempDir = await getTemporaryDirectory();
//   final tempFile = File('${tempDir.path}/$fileName');

//   await tempFile.writeAsBytes(byteData.buffer.asUint8List());
//   return tempFile.path;
// }





// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart' show rootBundle;
// // import 'package:flutter_application_1/information.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:flutter_application_1/welcome.dart';
// // import 'package:flutter_application_1/Add.dart';
// // import 'package:flutter_application_1/search.dart';
// // import 'package:image_picker/image_picker.dart';

// // class HomePage extends StatefulWidget {
// //   final String? username;
// //   final String? email;
// //   final File? profileImage; // إضافة هذه الخاصية لإظهار صورة البروفايل

// //   const HomePage({
// //     super.key,
// //     required this.username,
// //     required this.email,
// //     this.profileImage, // تم إضافة متغير البروفايل
// //   });

// //   @override
// //   State<HomePage> createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   List element = [
// //     {
// //       "name": "Altarih",
// //       "image": "assets/altarih.jpg",
// //       "pdf": "assets/pdf/c.pdf"
// //     },
// //     {"name": "Fun", "image": "assets/fun.jpeg", "pdf": "assets/pdf/c.pdf"},
// //     {"name": "Kill", "image": "assets/kill.jpeg", "pdf": "assets/pdf/c2.pdf"},
// //   ];

// //   Future<void> _navigateToAddPage() async {
// //     final newElement = await Navigator.push(
// //       context,
// //       MaterialPageRoute(builder: (context) => const AddPage()),
// //     );

// //     if (newElement != null && newElement is Map<String, dynamic>) {
// //       setState(() {
// //         element.add(newElement);
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final String displayName = widget.username ?? "Salem";
// //     final String displayEmail = widget.email ?? "salem@gmail.com";

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           "Books",
// //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: true,
// //         backgroundColor: const Color(0xFFA45963),
// //         actions: [
// //           IconButton(
// //             onPressed: () {
// //               showSearch(
// //                 context: context,
// //                 delegate: ItemSearchDelegate(element),
// //               );
// //             },
// //             icon: const Icon(Icons.search, color: Colors.white),
// //           ),
// //         ],
// //       ),
// //       drawer: Drawer(
// //         shadowColor: Colors.white,
// //         child: ListView(
// //           children: <Widget>[
// //             UserAccountsDrawerHeader(
// //               decoration: const BoxDecoration(
// //                 color: Color(0xFFA45963),
// //               ),
// //               accountName: Text(
// //                 displayName,
// //                 style: const TextStyle(fontWeight: FontWeight.bold),
// //               ),
// //               accountEmail: Text(displayEmail),
// //               currentAccountPicture: CircleAvatar(
// //                 backgroundImage: widget.profileImage != null
// //                     ? FileImage(widget.profileImage!)
// //                     : const AssetImage("assets/p5.png")
// //                         as ImageProvider,
// //               ),
// //             ),
// //             ListTile(
// //               title: const Text("Login"),
// //               leading: const Icon(Icons.login, color: Color(0xFFA45963)),
// //               onTap: () {
// //                 Navigator.pushNamed(context, 'login');
// //               },
// //             ),
// //             ListTile(
// //               title: const Text("SignUp"),
// //               leading: const Icon(Icons.group_add_outlined,
// //                   color: Color(0xFFA45963)),
// //               onTap: () {
// //                 Navigator.pushNamed(context, 'signup');
// //               },
// //             ),
// //             ListTile(
// //               title: const Text("Logout"),
// //               leading:
// //                   const Icon(Icons.logout_outlined, color: Color(0xFFA45963)),
// //               onTap: () {
// //                 Navigator.pushReplacement(context,
// //                     MaterialPageRoute(builder: (context) => WelcomePage()));
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //       body: GridView.builder(
// //         padding: const EdgeInsets.all(8.0),
// //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: 2,
// //           mainAxisSpacing: 8,
// //           crossAxisSpacing: 8,
// //           childAspectRatio: 0.7,
// //         ),
// //         itemCount: element.length,
// //         itemBuilder: (context, index) {
// //           return Card(
// //             elevation: 5,
// //             shape: RoundedRectangleBorder(
// //               borderRadius: BorderRadius.circular(15),
// //             ),
// //             child: Column(
// //               children: [
// //                 Expanded(
// //                   child: ClipRRect(
// //                     borderRadius: const BorderRadius.only(
// //                       topLeft: Radius.circular(15),
// //                       topRight: Radius.circular(15),
// //                     ),
// //                     child: element[index]['image'] != null
// //                         ? (element[index]['image'].startsWith('assets/')
// //                             ? Image.asset(
// //                                 element[index]['image'],
// //                                 fit: BoxFit.cover,
// //                                 width: double.infinity,
// //                               )
// //                             : Image.file(
// //                                 File(element[index]['image']),
// //                                 fit: BoxFit.cover,
// //                                 width: double.infinity,
// //                               ))
// //                         : const Icon(Icons.image, size: 50),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Text(
// //                     element[index]['name'],
// //                     style: const TextStyle(
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 16,
// //                     ),
// //                   ),
// //                 ),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                   children: [
// //                     IconButton(
// //                       onPressed: () async {
// //                         var updatedValue = await Navigator.pushNamed(
// //                           context,
// //                           'Edit',
// //                           arguments: element[index],
// //                         );
// //                         if (updatedValue != null &&
// //                             updatedValue is Map<String, dynamic>) {
// //                           setState(() {
// //                             element[index] = updatedValue;
// //                           });
// //                         }
// //                       },
// //                       icon: const Icon(Icons.edit, color: Color(0xFFA45963)),
// //                     ),
// //                     IconButton(
// //                       onPressed: () {
// //                         setState(() {
// //                           element.removeAt(index);
// //                         });
// //                       },
// //                       icon: const Icon(Icons.delete, color: Colors.red),
// //                     ),
// //                   ],
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(vertical: 8.0),
// //                   child: ElevatedButton(
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.white,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                         side: const BorderSide(color: Color(0xFFA45963)),
// //                       ),
// //                     ),
// //                     onPressed: () async {
// //                       if (element[index]['pdf'] != null) {
// //                         final filePath = element[index]['pdf'];

// //                         if (filePath.startsWith("assets/")) {
// //                           try {
// //                             final tempPath = await copyAssetToTemp(
// //                               filePath,
// //                               'temp_file_$index.pdf',
// //                             );

// //                             Navigator.push(
// //                               context,
// //                               MaterialPageRoute(
// //                                 builder: (context) =>
// //                                     PdfViewerPage(pdfPath: tempPath),
// //                               ),
// //                             );
// //                           } catch (e) {
// //                             ScaffoldMessenger.of(context).showSnackBar(
// //                               SnackBar(content: Text("Error loading PDF: $e")),
// //                             );
// //                           }
// //                         } else if (await File(filePath).exists()) {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) =>
// //                                   PdfViewerPage(pdfPath: filePath),
// //                             ),
// //                           );
// //                         } else {
// //                           ScaffoldMessenger.of(context).showSnackBar(
// //                             const SnackBar(
// //                                 content: Text("PDF file not found.")),
// //                           );
// //                         }
// //                       } else {
// //                         ScaffoldMessenger.of(context).showSnackBar(
// //                           const SnackBar(
// //                               content: Text("No PDF file associated.")),
// //                         );
// //                       }
// //                     },
// //                     child: const Text(
// //                       "View PDF",
// //                       style: TextStyle(color: Color(0xFFA45963)),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         backgroundColor: const Color(0xFFA45963),
// //         onPressed: _navigateToAddPage,
// //         child: const Icon(Icons.add, color: Colors.white),
// //       ),
// //     );
// //   }
// // }

// // Future<String> copyAssetToTemp(String assetPath, String fileName) async {
// //   final byteData = await rootBundle.load(assetPath);

// //   final tempDir = await getTemporaryDirectory();
// //   final tempFile = File('${tempDir.path}/$fileName');

// //   await tempFile.writeAsBytes(byteData.buffer.asUint8List());
// //   return tempFile.path;
// // }

// // class SignUpPage extends StatefulWidget {
// //   const SignUpPage({super.key});

// //   @override
// //   _SignUpPageState createState() => _SignUpPageState();
// // }

// // class _SignUpPageState extends State<SignUpPage> {
// //   final _usernameController = TextEditingController();
// //   final _emailController = TextEditingController();
// //   File? _imageFile;

// //   final ImagePicker _picker = ImagePicker();

// //   Future<void> _pickImage() async {
// //     final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
// //     if (pickedFile != null) {
// //       setState(() {
// //         _imageFile = File(pickedFile.path);
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Sign Up"),
// //         backgroundColor: const Color(0xFFA45963),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             GestureDetector(
// //               onTap: _pickImage,
// //               child: CircleAvatar(
// //                 radius: 50,
// //                 backgroundColor: Colors.grey,
// //                 backgroundImage: _imageFile != null
// //                     ? FileImage(_imageFile!)
// //                     : const AssetImage("assets/default_user.png")
// //                         as ImageProvider,
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             TextField(
// //               controller: _usernameController,
// //               decoration: const InputDecoration(labelText: "Username"),
// //             ),
// //             TextField(
// //               controller: _emailController,
// //               decoration: const InputDecoration(labelText: "Email"),
// //             ),
// //             const SizedBox(height: 16),
// //             ElevatedButton(
// //               onPressed: () {
// //                 Navigator.pushReplacement(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => HomePage(
// //                       username: _usernameController.text,
// //                       email: _emailController.text,
// //                       profileImage: _imageFile,
// //                     ),
// //                   ),
// //                 );
// //               },
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: const Color(0xFFA45963),
// //               ),
// //               child: const Text("Sign Up"),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_application_1/welcome.dart';
import 'package:flutter_application_1/Add.dart';
import 'package:flutter_application_1/search.dart';

class HomePage extends StatefulWidget {
  final String? username;
  final String? email;
  final File? profileImage; // Add profileImage as a parameter

  const HomePage({
    super.key,
    required this.username,
    required this.email,
    this.profileImage, // Make it optional
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List element = [
    {
      "name": "Altarih",
      "image": "assets/altarih.jpg",
      "pdf": "assets/pdf/c.pdf"
    },
    {"name": "Fun", "image": "assets/fun.jpeg", "pdf": "assets/pdf/c.pdf"},
    {"name": "Kill", "image": "assets/kill.jpeg", "pdf": "assets/pdf/c2.pdf"},
  ];

  Future<void> _navigateToAddPage() async {
    final newElement = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddPage()),
    );

    if (newElement != null && newElement is Map<String, dynamic>) {
      setState(() {
        element.add(newElement);
      });
    }
  }

  Future<String> copyAssetToTemp(String assetPath, String fileName) async {
    final byteData = await rootBundle.load(assetPath);

    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/$fileName');

    await tempFile.writeAsBytes(byteData.buffer.asUint8List());
    return tempFile.path;
  }

  @override
  Widget build(BuildContext context) {
    final String displayName = widget.username ?? "Salem";
    final String displayEmail = widget.email ?? "salem@gmail.com";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Books",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFA45963),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: ItemSearchDelegate(element),
              );
            },
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),
      drawer: Drawer(
        shadowColor: Colors.white,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFFA45963),
              ),
              accountName: Text(
                displayName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(displayEmail),
              currentAccountPicture: widget.profileImage != null
                  ? CircleAvatar(
                      backgroundImage: FileImage(widget.profileImage!),
                    )
                  : const CircleAvatar(
                      backgroundImage: AssetImage("assets/p5.png"),
                    ),
            ),
            ListTile(
              title: const Text("Logout"),
              leading:
                  const Icon(Icons.logout_outlined, color: Color(0xFFA45963)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemCount: element.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: element[index]['image'] != null
                        ? (element[index]['image'].startsWith('assets/')
                            ? Image.asset(
                                element[index]['image'],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              )
                            : Image.file(
                                File(element[index]['image']),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ))
                        : const Icon(Icons.image, size: 50),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    element[index]['name'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () async {
                        var updatedValue = await Navigator.pushNamed(
                          context,
                          'Edit',
                          arguments: element[index],
                        );
                        if (updatedValue != null &&
                            updatedValue is Map<String, dynamic>) {
                          setState(() {
                            element[index] = updatedValue;
                          });
                        }
                      },
                      icon: const Icon(Icons.edit, color: Color(0xFFA45963)),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          element.removeAt(index);
                        });
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Color(0xFFA45963)),
                      ),
                    ),
                    onPressed: () async {
                      if (element[index]['pdf'] != null) {
                        final filePath = element[index]['pdf'];

                        if (filePath.startsWith("assets/")) {
                          try {
                            final tempPath = await copyAssetToTemp(
                              filePath,
                              'temp_file_$index.pdf',
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PdfViewerPage(pdfPath: tempPath),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Error loading PDF: $e")),
                            );
                          }
                        } else if (await File(filePath).exists()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PdfViewerPage(pdfPath: filePath),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("PDF file not found.")),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("No PDF file associated.")),
                        );
                      }
                    },
                    child: const Text(
                      "View PDF",
                      style: TextStyle(color: Color(0xFFA45963)),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFA45963),
        onPressed: _navigateToAddPage,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class PdfViewerPage extends StatelessWidget {
  final String pdfPath;

  const PdfViewerPage({Key? key, required this.pdfPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PDF Viewer"),
        backgroundColor: const Color(0xFFA45963),
      ),
      body: PDFView(
        filePath: pdfPath,
      ),
    );
  }
}
