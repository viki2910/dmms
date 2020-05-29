class Paper{
  final int pid;
  final String boardname;
  final int amount;
  final int TotalMarks;
  final int totalattempt;
  final String examdate;
  final String examtime;
  final String examdatetime;
  final int packageid;
  final String papertitle;
  //final String solutions;
  final int numberofquestion;
  final int duration;
  Paper({this.pid,this.boardname,this.papertitle,this.numberofquestion,this.amount,this.TotalMarks,this.duration,this.totalattempt,this.examdate,this.examtime,this.examdatetime,this.packageid});
  factory Paper.fromJson(Map<String, dynamic> json) {
    return Paper(
      pid: json["pid"],
      boardname: json['boardname'],
      papertitle: json['papertitle'],
      //solutions: json['solutions'],
      numberofquestion: json['numberofquestion'],
      amount: json['amount'],
      TotalMarks: json['TotalMarks'],
      duration: json['duration'],
      totalattempt: json['totalattempt'],
      examdate: json['examdate'],
      examtime: json['examtime'],
      examdatetime: json['examdatetime'],
      packageid: json['packageid']
    );
  }
}