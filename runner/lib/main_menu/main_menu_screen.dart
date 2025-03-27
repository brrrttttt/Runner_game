import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../settings/settings.dart';
import '../style/responsive_screen.dart';
import '../style/wobbly_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/menu_bg.webp', // Change to your image path
              fit: BoxFit.cover, // Ensures the image covers the screen
            ),
          ),
          // Main Content
          ResponsiveScreen(
            squarishMainArea: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26, // Shadow color
                          blurRadius: 50, // Blur effect
                          spreadRadius: -50, // How far the shadow spreads
                           offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/vendorbanner.png',
                      filterQuality: FilterQuality.none,
                    ),
                  ),
                  Transform.rotate(
                    angle: 0,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 50,
                              spreadRadius: -50,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        child: const Text(
                          'Bermudez, Guinumtad, Go',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Press Start 2P',
                            color: Colors.white,
                            fontSize: 32,
                            height: 1,
                            shadows: [
                              Shadow(
                                offset: Offset(-5, -5),
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            rectangularMenuArea: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WobblyButton(
                  onPressed: () {
                    audioController.playSfx(SfxType.buttonTap);
                    GoRouter.of(context).go('/play');
                  },
                  child: const Text('Play'),
                ),
                _gap,
                WobblyButton(
                  onPressed: () => GoRouter.of(context).push('/settings'),
                  child: const Text('Settings'),
                ),
                _gap,
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: ValueListenableBuilder<bool>(
                    valueListenable: settingsController.audioOn,
                    builder: (context, audioOn, child) {
                      return IconButton(
                        onPressed: () => settingsController.toggleAudioOn(),
                        icon: Icon(audioOn ? Icons.volume_up : Icons.volume_off),
                        color: Colors.white,
                      );
                    },
                  ),
                ),
                _gap,
                const Text('Sound',
                style: TextStyle(
                fontFamily: 'Press Start 2P',
                color: Colors.white,
                ),
              ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static const _gap = SizedBox(height: 10);
}
