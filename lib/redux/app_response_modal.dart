class ResponseModal {
  final String type;
  dynamic payload;
  dynamic statuscode;
  dynamic error;

  ResponseModal(
      {required this.type, this.payload, this.statuscode, this.error});

  ResponseModal.responseResult(result, this.type) {
    if (result != null) {
      if (result is String) {
        payload = result;
        statuscode = null;
        error = result;
      } else if (result) {
        if (result.statusCode == 200) {
          payload = result.data;
          statuscode = result.statusCode;
          error = false;
        } else {
          payload = result.data['error_msg'].toString();
          statuscode = result.statusCode;
          error = result.statusMessage;
        }
      }
    } else {
      payload = null;
      statuscode = null;
      error = null;
    }
  }
}
