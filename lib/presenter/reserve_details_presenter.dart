import 'package:inovola_demo/api/dependancy_injection.dart';
import 'package:inovola_demo/api/error_response.dart';
import 'package:inovola_demo/models/reverse_details.dart';

abstract class ReserveDetailsContract {
  
void  onLoadReserveDetailsCompelete(ReverseDetailsModel items);
  void onLoadReserveDetailsError(ErrorResponse errorResponse);
  
}

class ReserveDetailsPresenter {
  ReserveDetailsContract _view;
  ReserveDetailsRepository _repository;

  ReserveDetailsPresenter(this._view) {
    _repository = new Injector().reserveDetailsRepository;
  }

  void loadReverseDetails() {
    _repository
        .fetchReserveDetails()
        .then((c) => _view.onLoadReserveDetailsCompelete(c))
        .catchError((onError) => _view.onLoadReserveDetailsError(onError));
  }
}
