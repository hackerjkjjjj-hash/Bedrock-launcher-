import 'package:android_intent_plus/android_intent.dart';
import 'package:url_launcher/url_launcher.dart';

class MinecraftService {
  static const String _minecraftPackage = 'com.mojang.minecraftpe';

  // បើក App Minecraft ធម្មតា
  // Returns true if the intent was sent successfully, false otherwise
  // (e.g. Minecraft PE is not installed, or the manifest is missing the
  // <queries> declaration required on Android 11+).
  static Future<bool> launchMinecraft() async {
    try {
      final intent = AndroidIntent(
        action: 'action_main',
        package: _minecraftPackage,
        category: 'category_launcher',
      );
      await intent.launch();
      return true;
    } catch (e) {
      print("Error launching Minecraft: $e");
      return false;
    }
  }

  // បន្ថែម Server ចូល Minecraft ដោយស្វ័យប្រវត្តិ
  // Note: Minecraft Bedrock's "addExternalServer" URI only ADDS the server
  // to the player's server list — it does not auto-join it. The player still
  // needs to tap it once inside Minecraft's Servers tab. This is a platform
  // limitation, not something that can be fixed on the app side.
  static Future<bool> joinServer(String ip, int port) async {
    final Uri url = Uri.parse('minecraft://?addExternalServer=LauncherServer|$ip:$port');
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
        return true;
      } else {
        print("Could not launch Minecraft with Server URI");
        return false;
      }
    } catch (e) {
      print("Error adding server: $e");
      return false;
    }
  }
}
