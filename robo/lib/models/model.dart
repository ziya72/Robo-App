import 'package:cloud_firestore/cloud_firestore.dart';

//members page
class Member {
  final String name;
  final String enrollmentNumber;
  final String course;
  final bool paymentStatus;

  Member({
    required this.name,
    required this.enrollmentNumber,
    required this.course,
    required this.paymentStatus,
  });

  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      name: map['name'] ?? '',
      enrollmentNumber: map['enrollmentNumber'] ?? '',
      course: map['course'] ?? '',
      paymentStatus: map['paymentStatus'] ?? false,
    );
  }
}

//issued components
class ComponentModel {
  final String name;
  final String course;
  final String yearOfStudy;
  final String componentsName;

  ComponentModel({
    required this.name,
    required this.course,
    required this.yearOfStudy,
    required this.componentsName,
  });

  factory ComponentModel.fromMap(Map<String, dynamic> map) {
    return ComponentModel(
      name: map['name'] ?? '',
      course: map['course'] ?? '',
      yearOfStudy: map['yearOfStudy'] ?? '',
      componentsName: map['componentsName'] ?? '',
    );
  }
}

//events page
class Event {
  final String eventName;
  final String posterURL;
  final String date;

  Event({required this.eventName, required this.posterURL, required this.date});

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      eventName: map['eventName'] ?? '',
      posterURL: map['posterURL'] ?? '',
      date: map['date'] ?? '',
    );
  }
  factory Event.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return Event.fromMap(data);
  }
}

//for project main page
class Project {
  final String name;
  final String date;
  final int progress;
  final List<String> projectImg;

  Project({
    required this.name,
    required this.date,
    required this.progress,
    required this.projectImg,
  });

  factory Project.fromMap(Map<String, dynamic> map) {
    final rawProgress = map['progress'];
    final intProgress =
        rawProgress is String
            ? int.tryParse(rawProgress) ?? 0
            : rawProgress is int
            ? rawProgress
            : 0;

    return Project(
      name: map['name'] ?? '',
      date: map['date'] ?? '',
      progress: intProgress,
      projectImg: List<String>.from(map['projectImg'] ?? []),
    );
  }
}

//for the detailed separate event page
class EventDetailModel {
  final String eventName;
  final String date;
  final String place;
  final String details;
  final String posterURL;
  final String regFormLink;

  EventDetailModel({
    required this.eventName,
    required this.date,
    required this.place,
    required this.details,
    required this.posterURL,
    required this.regFormLink,
  });

  factory EventDetailModel.fromMap(Map<String, dynamic> map) {
    return EventDetailModel(
      eventName: map['eventName'] ?? '',
      date: map['date'] ?? '',
      place: map['place'] ?? '',
      details: map['details'] ?? '',
      posterURL: map['posterURL'] ?? '',
      regFormLink: map['regFormLink'] ?? '',
    );
  }

  factory EventDetailModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return EventDetailModel.fromMap(data);
  }

  Map<String, dynamic> toMap() {
    return {
      'eventName': eventName,
      'date': date,
      'place': place,
      'details': details,
      'posterURL': posterURL,
      'regFormLink': regFormLink,
    };
  }
}

//projects team members
class TeamMember {
  final String member;
  final String linkedinId;

  TeamMember({required this.member, required this.linkedinId});

  factory TeamMember.fromMap(Map<String, dynamic> map) {
    return TeamMember(
      member: map['member'] ?? '',
      linkedinId: map['linkedinId'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {'member': member, 'linkedinId': linkedinId};
  }
}

//for the detialed projects page
class ProjectDetailModel {
  final String name;
  final String description;
  final String link;
  final String date;
  final String progress;
  final List<String> projectImg;
  final List<TeamMember> teamMembers;

  ProjectDetailModel({
    required this.name,
    required this.description,
    required this.link,
    required this.date,
    required this.progress,
    required this.projectImg,
    required this.teamMembers,
  });

  factory ProjectDetailModel.fromMap(Map<String, dynamic> map) {
    return ProjectDetailModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      link: map['link'] ?? '',
      date: map['date'] ?? '',
      progress: map['progress'].toString(),
      projectImg: List<String>.from(map['projectImg'] ?? []),
      teamMembers:
          (map['teamMembers'] as List<dynamic>?)
              ?.map((e) => TeamMember.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'link': link,
      'date': date,
      'progress': progress,
      'projectImg': projectImg,
      'teamMembers': teamMembers.map((e) => e.toMap()).toList(),
    };
  }
}

//for the components form
class ComponentFormModel {
  final String name;
  final String course;
  final String enrollmentNumber;
  final String facultyNumber;
  final String mobile;
  final String email;
  final String componentsName;

  ComponentFormModel({
    required this.name,
    required this.course,
    required this.enrollmentNumber,
    required this.facultyNumber,
    required this.mobile,
    required this.email,
    required this.componentsName,
  });

  factory ComponentFormModel.fromMap(Map<String, dynamic> map) {
    return ComponentFormModel(
      name: map['name'] ?? '',
      course: map['course'] ?? '',
      enrollmentNumber: map['enrollmentNumber'] ?? '',
      facultyNumber: map['facultyNumber'] ?? '',
      mobile: map['mobile'] ?? '',
      email: map['email'] ?? '',
      componentsName: map['componentsName'] ?? '',
    );
  }
}
