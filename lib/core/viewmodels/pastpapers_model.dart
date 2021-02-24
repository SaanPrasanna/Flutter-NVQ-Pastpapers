import '../../locator.dart';
import '../enums/veiw_state.dart';
import '../models/past_papers.dart';
import '../services/api_service.dart';
import 'base_model.dart';

class PastPapersModel extends BaseModel {
  APIService _apiService = locator<APIService>();

  PastPaper pastPaper;

  Future<PastPaper> getPastpapers() async {
    setState(ViewState.Busy);
    pastPaper = await _apiService.getPapers();
    setState(ViewState.Idle);
    return pastPaper;
  }
}
