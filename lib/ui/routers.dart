import 'package:flutter/material.dart';
import 'package:pastpapers/ui/view/module_view.dart';
import 'package:pastpapers/ui/view/paper_veiw.dart';
import 'package:pastpapers/ui/view/pdf_view.dart';

import '../core/models/past_papers.dart';
import 'view/home_view.dart';
import 'view/semester_view.dart';

const String initialRoute = 'Home';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'semesterView':
        var programme = settings.arguments as Programme;
        return MaterialPageRoute(
          builder: (_) => SemesterView(
            programme: programme,
          ),
        );
      case 'moduleView':
        var semester = settings.arguments as Semester;
        return MaterialPageRoute(
          builder: (_) => ModuleView(
            semester: semester,
          ),
        );
      case 'paperView':
        var module = settings.arguments as Modules;
        return MaterialPageRoute(
          builder: (_) => PapersView(
            module: module,
          ),
        );
      case 'PdfView':
        var paper = settings.arguments as Papers;
        return MaterialPageRoute(
          builder: (_) => PdfView(
            papers: paper,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
