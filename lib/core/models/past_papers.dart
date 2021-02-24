class PastPaper {
  String status;
  List<Programme> programme;

  PastPaper({this.status, this.programme});

  PastPaper.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? "";
    if (json['programme'] != null) {
      programme = new List<Programme>();
      json['programme'].forEach((v) {
        programme.add(new Programme.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.programme != null) {
      data['programme'] = this.programme.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Programme {
  String programme;
  List<Semester> semester;

  Programme({this.programme, this.semester});

  Programme.fromJson(Map<String, dynamic> json) {
    programme = json['programme'] ?? "";
    if (json['semester'] != null) {
      semester = new List<Semester>();
      json['semester'].forEach((v) {
        semester.add(new Semester.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['programme'] = this.programme;
    if (this.semester != null) {
      data['semester'] = this.semester.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Semester {
  String semesterNo;
  List<Modules> modules;

  Semester({this.semesterNo, this.modules});

  Semester.fromJson(Map<String, dynamic> json) {
    semesterNo = json['semesterNo'] ?? "";
    if (json['modules'] != null) {
      modules = new List<Modules>();
      json['modules'].forEach((v) {
        modules.add(new Modules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['semesterNo'] = this.semesterNo;
    if (this.modules != null) {
      data['modules'] = this.modules.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Modules {
  String name;
  List<Papers> papers;
  String moduleName1;

  Modules({this.name, this.papers, this.moduleName1});

  Modules.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['papers'] != null) {
      papers = new List<Papers>();
      json['papers'].forEach((v) {
        papers.add(new Papers.fromJson(v));
      });
    }
    moduleName1 = json['moduleName1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.papers != null) {
      data['papers'] = this.papers.map((v) => v.toJson()).toList();
    }
    data['moduleName1'] = this.moduleName1;
    return data;
  }
}

class Papers {
  String year;
  String name;
  String url;

  Papers({this.year, this.name, this.url});

  Papers.fromJson(Map<String, dynamic> json) {
    year = json['year'] ?? "";
    name = json['name'] ?? "";
    url = json['url'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
