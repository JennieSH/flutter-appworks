import 'package:flutter_appworks/constants/api_path.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;
import 'package:flutter_appworks/models/campaign.dart';

const _baseUrl = 'https://api.appworks-school.tw/api/1.0';

class CampaignService {
  Future<List<Campaign>> getCampaignList() async {
    try {
      Response response =
          await get(Uri.parse('$_baseUrl/${apiPath['campaign']}'));
      final List<dynamic> _data = convert.jsonDecode(response.body)['data'];
      List<Campaign> _campaigns =
          _data.map((json) => Campaign.fromJson(json)).toList();

      return _campaigns;
    } catch (error) {
      print('getCampaignList error $error');
      rethrow;
    }
  }
}
