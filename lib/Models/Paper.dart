class Paper{
  final String pid;
  final String boardname;
  final String amount;
  final String TotalMarks;
  final String totalattempt;
  final String examdate;
  final String examtime;
  final String examdatetime;
  final String packageid;
  final String papertitle;
  //final String solutions;
  final String numberofquestion;
  final String duration;
  Paper({this.pid,this.boardname,this.papertitle,this.numberofquestion,this.amount,this.TotalMarks,this.duration,this.totalattempt,this.examdate,this.examtime,this.examdatetime,this.packageid});
  factory Paper.fromJson(Map<String, dynamic> json) {
    return Paper(
      papertitle: json['papertitle'],
      //solutions: json['solutions'],
      numberofquestion: json['numberofquestion'],
      duration: json['duration']
    );
  }
}