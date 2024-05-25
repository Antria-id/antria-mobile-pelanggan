import 'package:antria_mobile_pelanggan/config/themes/themes.dart';
import 'package:antria_mobile_pelanggan/features/chat/presentation/widgets/mitra_chat_widget.dart';
import 'package:antria_mobile_pelanggan/features/chat/presentation/widgets/pelanggan_chat_widget.dart';
import 'package:antria_mobile_pelanggan/features/chat/presentation/widgets/text_chat_widget.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: const NetworkImage(
                  'https://i.postimg.cc/nLq2tk6y/IMG-2585-1.png'),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mie Gacoan Bojongsoang',
                    style: whiteTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '08666666666',
                    style: whiteTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            )
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: primaryColor,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MitraChatWidget(
              name: 'Mie Gacoan Bojongsoang',
              text: 'Mie nya habis, mau diganti lele ngga?',
              time: '29m',
            ),
            PelangganChatWidget(
              name: 'Anda',
              text: 'Ouhh, boleh kak, tambahin gurameh yaa',
              time: '29m',
            ),
            MitraChatWidget(
              name: 'Mie Gacoan Bojongsoang',
              text: 'Oke kalau begitu',
              time: '29m',
            ),
            PelangganChatWidget(
              name: 'Anda',
              text: 'Okayy mantapp',
              time: '29m',
            ),
            MitraChatWidget(
              name: 'Mie Gacoan Bojongsoang',
              text: 'Oke kalau begitu',
              time: '29m',
            ),
            PelangganChatWidget(
              name: 'Anda',
              text: 'Okayy mantapp',
              time: '29m',
            ),
            MitraChatWidget(
              name: 'Mie Gacoan Bojongsoang',
              text: 'Oke kalau begitu',
              time: '29m',
            ),
            PelangganChatWidget(
              name: 'Anda',
              text: 'Okayy mantapp',
              time: '29m',
            ),
            MitraChatWidget(
              name: 'Mie Gacoan Bojongsoang',
              text: 'Oke kalau begitu',
              time: '29m',
            ),
            PelangganChatWidget(
              name: 'Anda',
              text: 'Okayy mantapp',
              time: '29m',
            ),
          ],
        ),
      ),
      bottomNavigationBar: const TextChatWidget(),
    );
  }
}
