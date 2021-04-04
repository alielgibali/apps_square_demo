import 'package:apps_square_demo/api/endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:apps_square_demo/models/company_data_model.dart';
import 'package:apps_square_demo/api/api_client.dart';

class CompanyProvider with ChangeNotifier {
  Future<List<ComapnyDataModel>> comapanyData() async {
    return await getCallService(
      APIs.mainUrl,
      RequestType.GetCompanyData,
    );
  }
}
