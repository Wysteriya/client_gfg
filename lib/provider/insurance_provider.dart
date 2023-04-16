import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:insurego_gfg/models/insurance_model.dart';

class InsuranceProvider with ChangeNotifier {
  List<Insurance> _insurances = [];

  List<Insurance> get insurances {
    return [..._insurances];
  }

  Future<void> fetchInsurances() async {
    final url = 'https://34.125.247.127:9090/baby_chain/public/list_ins/';

    try {
      final response = await http.get(Uri.parse(url));

      final extractedData = json.decode(response.body)['data'];
      print(extractedData);

      final List<Insurance> loadedInsurances = [];

      extractedData.forEach((key, value) {
        _insurances.add(Insurance.fromJson(value, id: key));
      });

      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}

class InsurancePolicy {
  final String policyName;
  final String description;
  final String companyName;
  final String coverageValue;
  final String monthlyCost;
  final String claimSuccessPercentage;
  final String launchDate;
  final String type;
  final String maximumAge;

  InsurancePolicy({
    required this.policyName,
    required this.description,
    required this.companyName,
    required this.coverageValue,
    required this.monthlyCost,
    required this.claimSuccessPercentage,
    required this.launchDate,
    required this.type,
    required this.maximumAge,
  });
}

class InsurancePolicyProvider extends ChangeNotifier {
  List<InsurancePolicy> _policies = [];

  List<InsurancePolicy> get policies {
    return [..._policies];
  }

   fetchPolicies() async {
    final url = Uri.parse('http://34.125.247.127:9090/baby_chain/public/list_ins/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final policiesData = responseData['data'];
      print(policiesData);
      _policies = [];
      policiesData.forEach((key, policyData) {
        _policies.add(InsurancePolicy(
            policyName: key,
            description: policyData['description'],
            companyName: policyData['company_name'],
            coverageValue: policyData['coverage_value'],
            monthlyCost:policyData['monthly_cost'],
            claimSuccessPercentage: policyData['claim_success_percentage'],
            launchDate: policyData['launch_date'],
            type: policyData['type'],
            maximumAge: policyData['other_details'],));
      });

      notifyListeners();
    } else {
      throw Exception('Failed to fetch policies');
    }
  }
}
