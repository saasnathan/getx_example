class PixApi {
  Future<List<Map<String, dynamic>>?> getPixKeys() async {
    await Future.delayed(Duration(seconds: 2));

    return [
      {'id': 1, 'type': 'EVP', 'data': '235wef4-cw23rfw-32fwt4wgs-3wgsfg'},
      {'id': 2, 'type': 'PHONE', 'data': '(19) 9 0000-0000'},
      {'id': 3, 'type': 'EMAIL', 'data': 'email@email.com'},
      {'id': 4, 'type': 'TAXID', 'data': '423.321.232-64'},
    ];
  }

  Future<Map<String, dynamic>?> getPixKeyDetails(int id) async {
    await Future.delayed(Duration(seconds: 2));

    return [
      {'id': 1, 'createdAt': 1644852678, 'status': 'ACTIVE'},
      {'id': 2, 'createdAt': 1644852278, 'status': 'PEDDING'},
      {'id': 3, 'createdAt': 1644851678, 'status': 'ACTIVE'},
      {'id': 4, 'createdAt': 1644852668, 'status': 'ACTIVE'},
    ].firstWhere((element) => element['id'] == id);
  }
}
