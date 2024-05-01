import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsList {
  final List<NotificationModel> notifications;
  NotificationsList({required this.notifications});
  factory NotificationsList.fromQuery(QuerySnapshot snapshot) => NotificationsList(
        notifications: List<NotificationModel>.from(
          snapshot.docs.map((doc) => NotificationModel.fromSnapshot(doc.data() as Map<String, dynamic>, doc.id)),
        ),
      );
}

class NotificationModel {
  final String avatarText;
  final String avatarUrl;
  final String body;
  final dynamic createdAt;
  final String notificationImage;
  final int pageIndex;
  final String route;
  final String title;
  final dynamic updatedAt;
  final String? docId;
  NotificationModel({
    required this.avatarText,
    required this.avatarUrl,
    required this.body,
    required this.createdAt,
    required this.notificationImage,
    required this.pageIndex,
    required this.route,
    required this.title,
    required this.updatedAt,
    this.docId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatarText': avatarText,
      'avatarUrl': avatarUrl,
      'body': body,
      'createdAt': createdAt,
      'notificationImage': notificationImage,
      'pageIndex': pageIndex,
      'route': route,
      'title': title,
      'updatedAt': updatedAt,
      'deleted': false,
    };
  }

  factory NotificationModel.fromSnapshot(Map<String, dynamic> map, String docId) {
    return NotificationModel(
      avatarText: map['avatarText'],
      avatarUrl: map['avatarUrl'],
      body: map['body'],
      createdAt: map['createdAt'],
      notificationImage: map['notificationImage'],
      pageIndex: map['pageIndex'].toInt(),
      route: map['route'],
      title: map['title'].trim(),
      updatedAt: map['updatedAt'],
      docId: docId,
    );
  }
}
