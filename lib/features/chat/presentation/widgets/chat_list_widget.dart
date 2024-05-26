import 'package:flutter/material.dart';

import 'chat_card_widget.dart';

class ChatListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> chatList = [
    {
      'nama': 'Mie Gacoan Bojongsoang',
      'image': 'https://i.postimg.cc/nLq2tk6y/IMG-2585-1.png',
      'message': 'Halo apakah pesanan saya sudah siap?',
      'count_chat': '1',
    },
    {
      'nama': 'Mie Gacoan Bojongsoang',
      'image': 'https://i.postimg.cc/nLq2tk6y/IMG-2585-1.png',
      'message': 'Halo apakah pesanan saya sudah siap?',
      'count_chat': '1',
    },
    {
      'nama': 'Mie Gacoan Bojongsoang',
      'image': 'https://i.postimg.cc/nLq2tk6y/IMG-2585-1.png',
      'message': 'Halo apakah pesanan saya sudah siap?',
      'count_chat': '1',
    },
    {
      'nama': 'Mie Gacoan Bojongsoang',
      'image': 'https://i.postimg.cc/nLq2tk6y/IMG-2585-1.png',
      'message': 'Halo apakah pesanan saya sudah siap?',
      'count_chat': '1',
    },
    {
      'nama': 'Mie Gacoan Bojongsoang',
      'image': 'https://i.postimg.cc/nLq2tk6y/IMG-2585-1.png',
      'message': 'Halo apakah pesanan saya sudah siap?',
      'count_chat': '1',
    },
    {
      'nama': 'Mie Gacoan Bojongsoang',
      'image': 'https://i.postimg.cc/nLq2tk6y/IMG-2585-1.png',
      'message': 'Halo apakah pesanan saya sudah siap?',
      'count_chat': '1',
    },
    {
      'nama': 'Mie Gacoan Bojongsoang',
      'image': 'https://i.postimg.cc/nLq2tk6y/IMG-2585-1.png',
      'message': 'Halo apakah pesanan saya sudah siap?',
      'count_chat': '1',
    },
  ];

  int getTotalUnreadCount() {
    int totalCount = 0;
    for (var chat in chatList) {
      totalCount += int.parse(chat['count_chat']);
    }
    return totalCount;
  }

  ChatListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(bottom: 50),
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        final chat = chatList[index];
        return CardChatWidget(
          nama: chat['nama'],
          message: chat['message'],
          image: chat['image'],
          countChat: chat['count_chat'],
          onTap: () {
            Navigator.pushNamed(
              context,
              '/chat-page',
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 2,
        );
      },
    );
  }
}
