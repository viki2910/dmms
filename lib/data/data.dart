import 'package:dmms/Models/dashboard_cards.dart';
import 'package:dmms/Models/image_quiz.dart';
import 'package:flutter/material.dart';



final List<DashCard> cards = [
  DashCard( imageUrl: 'assets/live-test.png', name: 'Live Test'),
  DashCard( imageUrl: 'assets/my-paper.png', name: 'My Paper'),
  DashCard( imageUrl: 'assets/view-solution.png', name: 'View Solution'),
  DashCard( imageUrl: 'assets/join-test.webp', name: 'Join TestSeries'),
  DashCard( imageUrl: 'assets/study-material.png', name: 'Study Material'),
  DashCard( imageUrl: 'assets/current-affairs.webp', name: 'Current Affairs'),
  DashCard( imageUrl: 'assets/vacancy-info.png', name: 'Vacancy Information'),
  DashCard( imageUrl: 'assets/profile-info.png', name: 'Profile Information'),
  DashCard( imageUrl: 'assets/help-support.webp', name: 'Help & Support'),
  DashCard( imageUrl: 'assets/change-password.webp', name: 'Change Password'),
  DashCard( imageUrl: 'assets/logout.png', name: 'Logout'),
];

final List<DashCard> videoQuiz = [
  DashCard( imageUrl: 'assets/my-paper.png', name: 'QUIZ FOR ESIC, PGI, DSSSB EXAM'),
  DashCard( imageUrl: 'assets/quiz.png', name: 'DMMS SPECIAL'),
  DashCard( imageUrl: 'assets/view-solution.png', name: 'TARGET AIIMS 2020'),

];


final List<ImageQuiz> imageQuiz = [
  ImageQuiz(title:'Quiz for all AIIMS Exam', description:'Based on Jodhpur AIIMS, Delhi AIIMS, Patna AIIMS all exams'),
  ImageQuiz(title:'Quiz for ESIC, PGI, DSSSB Exam', description:'Based on All Central Government Nursing Officer Exam. Join Membership Test Series for Full Paper'),
  ImageQuiz(title:'Quiz for Nursing Officer Exam', description:'Based on all State Government Nursing Officer Exam'),
];

List<AssetImage> imageList = [
  AssetImage('assets/car1.webp'),
  AssetImage('assets/car2.webp'),
  // AssetImage('assets/change-password.png'),
];