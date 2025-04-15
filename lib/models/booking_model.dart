class BookingModel {
  final String id;
  final String userId;
  final String trainerId;
  final DateTime dateTime;
  final String service; // e.g. "Stretch Therapy"
  final String status; // e.g. "pending", "confirmed", "completed"

  BookingModel({
    required this.id,
    required this.userId,
    required this.trainerId,
    required this.dateTime,
    required this.service,
    this.status = 'pending',
  });

  factory BookingModel.fromMap(Map<String, dynamic> map, String id) {
    return BookingModel(
      id: id,
      userId: map['userId'] ?? '',
      trainerId: map['trainerId'] ?? '',
      dateTime: (map['dateTime'] as Timestamp).toDate(),
      service: map['service'] ?? '',
      status: map['status'] ?? 'pending',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'trainerId': trainerId,
      'dateTime': dateTime,
      'service': service,
      'status': status,
    };
  }
}
