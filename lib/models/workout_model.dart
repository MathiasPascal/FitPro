class WorkoutModel {
  final String id;
  final String userId;
  final String type; // e.g. "Cardio", "Stretching"
  final int duration; // in minutes
  final DateTime timestamp;
  final String? mediaUrl;

  WorkoutModel({
    required this.id,
    required this.userId,
    required this.type,
    required this.duration,
    required this.timestamp,
    this.mediaUrl,
  });

  factory WorkoutModel.fromMap(Map<String, dynamic> map, String id) {
    return WorkoutModel(
      id: id,
      userId: map['userId'] ?? '',
      type: map['type'] ?? '',
      duration: map['duration'] ?? 0,
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      mediaUrl: map['mediaUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'type': type,
      'duration': duration,
      'timestamp': timestamp,
      'mediaUrl': mediaUrl,
    };
  }
}
