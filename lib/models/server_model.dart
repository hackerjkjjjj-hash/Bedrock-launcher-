class ServerModel {
  final String id;
  final String name;
  final String ip;
  final int port;
  final String? description;
  final String? imageUrl;
  final bool isOnline;
  final int playerCount;

  ServerModel({
    required this.id,
    required this.name,
    required this.ip,
    this.port = 19132, // Port ទូទៅរបស់ Minecraft Bedrock
    this.description,
    this.imageUrl,
    this.isOnline = true,
    this.playerCount = 0,
  });

  // សម្រាប់បម្លែងទិន្នន័យពី JSON (ពេលទាញទិន្នន័យពី API ឬ Local Storage)
  factory ServerModel.fromJson(Map<String, dynamic> json) {
    return ServerModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      ip: json['ip'] ?? '',
      port: json['port'] ?? 19132,
      description: json['description'],
      imageUrl: json['imageUrl'],
      isOnline: json['isOnline'] ?? true,
      playerCount: json['playerCount'] ?? 0,
    );
  }

  // សម្រាប់បម្លែងទិន្នន័យទៅជា JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'ip': ip,
      'port': port,
      'description': description,
      'imageUrl': imageUrl,
      'isOnline': isOnline,
      'playerCount': playerCount,
    };
  }
}
