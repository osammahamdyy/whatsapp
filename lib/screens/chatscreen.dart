import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class chatScreen extends StatelessWidget {
  const chatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMe = true;
    Color greenColor = Color(0xFF168C4B);
    return Scaffold(
      backgroundColor: Colors.transparent,

      appBar: AppBar(
        backgroundColor: greenColor,
        leading: ImageIcon(
          AssetImage('lib/assets/images/back.png'),
          color: Colors.white,
        ),
        titleSpacing: 2,
        centerTitle: false,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                'lib/assets/images/profile_image (1).png',
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Online',
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call_outlined, color: Colors.white),
            onPressed: () {
              // Handle call button press
            },
          ),
          IconButton(
            icon: Image.asset(
              'lib/assets/images/video.png',
              color: Colors.white,
            ),
            onPressed: () {
              // Handle video button press
            },
          ),
          IconButton(
            icon: Image.asset(
              'lib/assets/images/more.png',
              color: Colors.white,
            ),
            onPressed: () {
              // Handle more button press
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(10),
                  children: [
                    bubble('Hello!', false),
                    bubble('Hello!', true),
                    bubble(
                      'Hey! Have you ever thought about how random moments can sometimes turn into the best memories? It’s like the universe loves to surprise us when we least expect it!',
                      false,
                    ),
                    bubble(
                      'what a Great Content Tp learn Flutter',
                      false,
                      image: 'lib/assets/images/route.png',
                    ),
                    bubble('what a Great Content Tp learn Flutter?', true),
                  ],
                ),
              ),
              inputBar(),
            ],
            
          ),
          

        ],
      ),
    );
  }
}

Widget bubble(String text, bool isMe, {String? image}) {
  Color greenColor = Color(0xFF168C4B);
  Color greyColor = Color(0xFF232D36);
  return Align(
    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(14),
      constraints: const BoxConstraints(maxWidth: 280),
      decoration: BoxDecoration(
        color: isMe ? greyColor : greenColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(24),
          topRight: const Radius.circular(24),
          bottomLeft: Radius.circular(
            isMe ? 24 : 0,
          ), // sharp corner on received bubbles
          bottomRight: Radius.circular(
            isMe ? 0 : 24,
          ), // sharp corner on sent bubbles
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 16)),
          if (image != null) Image.asset(image),
        ],
      ),
    ),
  );
}
Widget inputBar() {
  Color greenColor = const Color(0xFF168C4B);

  return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Type a Message ...',
              hintStyle: const TextStyle(color: Colors.white),
              filled: true,
              fillColor: const Color(0xFF121212),
              prefixIcon: const Padding(
                padding: EdgeInsets.all(12),
                child: ImageIcon(
                  AssetImage('lib/assets/images/camera.png'),
                  color: Colors.white,
                ),
              ),
              suffixIcon: const Padding(
                padding: EdgeInsets.all(12),
                child: ImageIcon(
                  AssetImage('lib/assets/images/Send.png'),
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: greenColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: greenColor),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: greenColor,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: ImageIcon(
              AssetImage('lib/assets/images/Mic.png'),
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}