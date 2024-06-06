class NotificationsModel {
  int? notificationsId;
  String? notificationsTitle;
  String? notificationsBody;
  int? notificationsUsersid;
  String? notificationsDatetime;

  NotificationsModel({
    this.notificationsId,
    this.notificationsTitle,
    this.notificationsBody,
    this.notificationsUsersid,
    this.notificationsDatetime,
  });

  factory NotificationsModel.fromJson(Map<String, dynamic> json) {
    return NotificationsModel(
      notificationsId: json['notifications_id'] as int?,
      notificationsTitle: json['notifications_title'] as String?,
      notificationsBody: json['notifications_body'] as String?,
      notificationsUsersid: json['notifications_usersid'] as int?,
      notificationsDatetime: json['notifications_datetime'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'notifications_id': notificationsId,
        'notifications_title': notificationsTitle,
        'notifications_body': notificationsBody,
        'notifications_usersid': notificationsUsersid,
        'notifications_datetime': notificationsDatetime,
      };
}
