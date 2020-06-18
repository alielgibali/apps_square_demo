import 'package:inovola_demo/api/api_client.dart';
import 'package:inovola_demo/models/reverse_details.dart';

class MockReserveDetailsRepository
    implements ReserveDetailsRepository {
 
  String reserveDetails = 'https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34';

  @override
  Future<ReverseDetailsModel> fetchReserveDetails() async{
    return await getCallService(reserveDetails, RequestType.GetReverseDetails ,'');
  }
}