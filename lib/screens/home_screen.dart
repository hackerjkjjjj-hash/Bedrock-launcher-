import 'package:flutter/material.dart';
import '../constants/app_styles.dart';
import '../models/server_model.dart';
import '../services/minecraft_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // បញ្ជី Server គំរូដោយប្រើ ServerModel
  static final List<ServerModel> _serverList = [
    ServerModel(
      id: '1',
      name: 'Hyperium Network',
      ip: 'play.hyperium.net',
      port: 19132,
      playerCount: 3200,
    ),
    ServerModel(
      id: '2',
      name: 'Hive Bedrock',
      ip: 'geo.hivebedrock.network',
      port: 19132,
      playerCount: 12500,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text('BEDROCK\nLAUNCHER', style: AppStyles.titleStyle),
              const SizedBox(height: 10),
              
              // អាប់ដេត Version ទៅ v1.26.33 នៅទីនេះ
              Text('v1.26.33 | Ready to Play', style: AppStyles.subtitleStyle),
              
              const SizedBox(height: 30),

              // Main Play Button (Big, Modern Green)
              GestureDetector(
                onTap: () async {
                  final launched = await MinecraftService.launchMinecraft();
                  if (!launched && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('រកមិនឃើញ Minecraft PE នៅលើឧបករណ៍នេះទេ។ សូមដំឡើងវាសិន។'),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: NetworkImage('https://i.imgur.com/G5Z5oE8.png'),
                      fit: BoxFit.cover,
                      opacity: 0.4,
                    ),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.play_arrow_rounded, size: 50, color: Colors.white),
                        Text(
                          'PLAY NOW',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Quick Join Servers Section
              Text(
                'QUICK JOIN SERVERS',
                style: AppStyles.titleStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 15),

              // បង្ហាញ Server List
              Column(
                children: _serverList
                    .map((server) => Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: _buildServerCard(context, server),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServerCard(BuildContext context, ServerModel server) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: AppStyles.cardDecoration,
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.background,
            child: Icon(Icons.dns, color: AppColors.accentGreen),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  server.name,
                  style: const TextStyle(
                    color: AppColors.textMain,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(server.ip, style: AppStyles.subtitleStyle),
              ],
            ),
          ),
          Text(
            '${server.playerCount} Online',
            style: const TextStyle(color: AppColors.accentGreen, fontSize: 12),
          ),
          IconButton(
            icon: const Icon(Icons.bolt, color: AppColors.textSecondary),
            onPressed: () async {
              final added = await MinecraftService.joinServer(server.ip, server.port);
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(added
                        ? 'បានបញ្ចូល ${server.name} ទៅក្នុងបញ្ជី Server — សូមចុច Play ក្នុង Minecraft ដើម្បីចូលលេង'
                        : 'មិនអាចបើក Minecraft PE បានទេ សូមពិនិត្យមើលថាបានដំឡើងហើយឬនៅ'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
