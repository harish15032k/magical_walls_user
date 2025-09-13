import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:magical_walls_user/core/base/base_response.dart';

abstract class BaseApiService {
  Future<BaseResponse> getPostApiResponse(
    String url,
    dynamic data, {
    String? token,
  });

  Future<BaseResponse> getApiResponse(
    String url, [
    Map<String, dynamic>? args,
    String? token,
  ]);

  Future<BaseResponse> getDeleteApiResponse(
    String url, [
    Map<String, dynamic>? args,
    String? token,
  ]);

  Future<BaseResponse> uploadFileApiResponse(String url, dynamic data);

  Future<BaseResponse> uploadImageApiResponse(String url, dynamic data);

  Future<BaseResponse> uploadMaterialFileApiResponse(String url, dynamic data);
}

class NetworkApiService extends BaseApiService {
  @override
  Future<BaseResponse> getPostApiResponse(
    String url,
    dynamic data, {
    String? token,
  }) async {
    return _handleRequest(
      () async {
        final response = await http
            .post(
              Uri.parse(url),
              body: jsonEncode(data),
              headers: _headers(token),
            )
            .timeout(const Duration(seconds: 15));
        return response;
      },
      url,
      data,
    );
  }

  @override
  Future<BaseResponse> getApiResponse(
    String url, [
    Map<String, dynamic>? args,
    String? token,
  ]) async {
    final Map<String, dynamic> queryParams = args ?? {};
    if (token != null) {
      queryParams['token'] = token;
    }
    return _handleRequest(
      () async {
        final uri = Uri.parse(url).replace(
          queryParameters: queryParams.isNotEmpty
              ? queryParams.map((k, v) => MapEntry(k, v.toString()))
              : null,
        );
        log("api ${uri.toString()}");
        final response = await http
            .get(uri, headers: _headers())
            .timeout(const Duration(seconds: 15));
        return response;
      },
      url,
      queryParams,
    );
  }

  @override
  Future<BaseResponse> getDeleteApiResponse(
    String url, [
    Map<String, dynamic>? args,
    String? token,
  ]) async {
    final Map<String, dynamic> queryParams = args ?? {};
    if (token != null) {
      queryParams['token'] = token;
    }
    return _handleRequest(
      () async {
        final uri = Uri.parse(url).replace(
          queryParameters: queryParams.isNotEmpty
              ? queryParams.map((k, v) => MapEntry(k, v.toString()))
              : null,
        );
        final response = await http
            .delete(uri, headers: _headers())
            .timeout(const Duration(seconds: 15));
        return response;
      },
      url,
      queryParams,
    );
  }

  @override
  Future<BaseResponse> uploadFileApiResponse(String url, dynamic data) async {
    return _handleMultipartRequest(
      () async {
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // Add all fields except the file
        data.forEach((key, value) {
          if (key != 'file' && value != null) {
            // Skip null values and the file field
            request.fields[key.toString()] = value.toString();
          }
        });

        print(" adsfasf ${data['file']}");
        if (data['file'] is PlatformFile) {
          PlatformFile file = data['file'];

          if (file.path != null) {
            MediaType contentType;
            switch (file.extension?.toLowerCase()) {
              case 'xls':
                contentType = MediaType('application', 'vnd.ms-excel');
                break;
              case 'xlsx':
                contentType = MediaType(
                  'application',
                  'vnd.openxmlformats-officedocument.spreadsheetml.sheet',
                );
                break;
              case 'csv':
                contentType = MediaType('text', 'csv');
                break;
              case 'pdf':
                contentType = MediaType('application', 'pdf');
                break;
              case 'jpeg':
                contentType = MediaType('image', 'jpeg');
                break;
              case 'jpg':
                contentType = MediaType('image', 'jpg');
                break;
              case 'png':
                contentType = MediaType('image', 'png');
                break;
              default:
                contentType = MediaType('application', 'octet-stream');
            }

            log('Uploading file: ${file.name}');
            log('Content-Type: ${contentType.type}/${contentType.subtype}');

            request.files.add(
              await http.MultipartFile.fromPath(
                'file', // Field name for the file
                file.path!,
                filename: file.name,
                contentType: contentType,
              ),
            );
          } else if (file.bytes != null) {
            var fallbackType = MediaType('application', 'octet-stream');
            log('Uploading file from bytes: ${file.name}');
            log('Content-Type: ${fallbackType.type}/${fallbackType.subtype}');

            request.files.add(
              http.MultipartFile.fromBytes(
                'file', // Field name for the file
                file.bytes!,
                filename: file.name,
                contentType: fallbackType,
              ),
            );
          }
        }

        // Log detailed request information
        log('Sending multipart request to: $url');
        log('Headers: ${request.headers}');
        log('Fields: ${request.fields}');
        log(
          'Files: ${request.files.map((f) => {'filename': f.filename, 'field': f.field, 'size': f.length, 'contentType': f.contentType.toString()}).toList()}',
        );

        // Send the request
        final response = await request.send();
        return await http.Response.fromStream(response);
      },
      url,
      data,
    );
  }

  @override
  Future<BaseResponse> uploadMaterialFileApiResponse(
    String url,
    dynamic data,
  ) async {
    return _handleMultipartRequest(
      () async {
        var request = http.MultipartRequest('POST', Uri.parse(url));
        // Add all fields except the file
        data.forEach((key, value) {
          if (key != 'file' && value != null) {
            // Skip null values and the file field
            request.fields[key.toString()] = value.toString();
          }
        });
        // Handle file upload if present
        if (data['file'] is File) {
          File file = data['file'];
          if (file.path != '') {
            // Determine MIME type based on extension
            MediaType contentType;
            // switch (file.extension?.toLowerCase()) {
            //   case 'jpeg':
            //   case 'jpg':
            //     contentType = MediaType('application', 'jpeg');
            //     break;
            //   case 'png':
            //     contentType = MediaType('application', 'png');
            //     break;
            //   default:
            contentType = MediaType('application', 'pdf');
            //   }
            log('Uploading file: $file');
            log('Content-Type: ${contentType.type}/${contentType.subtype}');
            request.files.add(
              await http.MultipartFile.fromPath(
                'material_file', // Field name for the file
                file.path,
                filename: file.path,
                contentType: contentType,
              ),
            );
          }
          // else if (file.path != null) {
          //   var fallbackType = MediaType('application', 'octet-stream');
          //   log('Uploading file from bytes: ${file.path}');
          //   log('Content-Type: ${fallbackType.type}/${fallbackType.subtype}');
          //
          //   request.files.add(
          //     http.MultipartFile.fromBytes(
          //       'file', // Field name for the file
          //       file.bytes!,
          //       filename: file.path,
          //       contentType: fallbackType,
          //     ),
          //   );
          // }
        }
        // Log detailed request information
        log('Sending multipart request to: $url');
        log('Headers: ${request.headers}');
        log('Fields: ${request.fields}');
        log(
          'Files: ${request.files.map((f) => {'filename': f.filename, 'field': f.field, 'size': f.length, 'contentType': f.contentType.toString()}).toList()}',
        );
        // Send the request
        final response = await request.send();
        return await http.Response.fromStream(response);
      },
      url,
      data,
    );
  }

  // Future<dynamic> uploadImageApiResponse(String url, dynamic data) async {
  //   return _handleMultipartRequest(() async {
  //     var request = http.MultipartRequest('POST', Uri.parse(url));
  //
  //     // Add token to headers if present
  //     if (data['token'] is String && data['token'].isNotEmpty) {
  //       request.headers.addAll(_headers(data['token']));
  //     }
  //
  //     // Add all fields except file, image, and token
  //     data.forEach((key, value) {
  //       if (key != 'file' && key != 'image' && key != 'token' && value != null) {
  //         // Skip null values and file/image/token fields
  //         request.fields[key.toString()] = value.toString();
  //       }
  //     });
  //
  //     // Handle file upload if present
  //     File? file;
  //     String? filename;
  //     if (data['file'] is File) {
  //       file = data['file'];
  //       filename = file?.path.split('/').last;
  //     } else if (data['image'] is File) {
  //       file = data['image'];
  //       filename = file?.path.split('/').last;
  //     } else if (data['image'] is String && data['image'].isNotEmpty) {
  //       file = File(data['image']);
  //       filename = data['image'].split('/').last;
  //     }
  //
  //     if (file != null && file.path != '') {
  //       // Determine MIME type based on extension
  //       String extension = filename!.split('.').last.toLowerCase();
  //       MediaType contentType;
  //       switch (extension) {
  //         case 'jpg':
  //         case 'jpeg':
  //           contentType = MediaType('image', 'jpeg');
  //           break;
  //         case 'png':
  //           contentType = MediaType('image', 'png');
  //           break;
  //         default:
  //           contentType = MediaType('image', 'png'); // Fallback
  //       }
  //
  //       log('Uploading file: ${file}');
  //       log('Content-Type: ${contentType.type}/${contentType.subtype}');
  //
  //       request.files.add(
  //         await http.MultipartFile.fromPath(
  //           'file', // Field name for the file
  //           file.path,
  //           filename: filename,
  //           contentType: contentType,
  //         ),
  //       );
  //     }
  //
  //     // Log detailed request information
  //     log('Sending multipart request to: $url');
  //     log('Headers: ${request.headers}');
  //     log('Fields: ${request.fields}');
  //     log('Files: ${request.files.map((f) => {
  //       'filename': f.filename,
  //       'field': f.field,
  //       'size': f.length,
  //       'contentType': f.contentType.toString()
  //     }).toList()}');
  //
  //     // Send the request
  //     final response = await request.send();
  //     return await http.Response.fromStream(response);
  //   }, url, data);
  // }

  @override
  Future<BaseResponse> uploadImageApiResponse(String url, dynamic data) async {
    return _handleMultipartRequest(
      () async {
        var request = http.MultipartRequest('POST', Uri.parse(url));

        // Add all fields except the file
        data.forEach((key, value) {
          if (key != 'file' && value != null) {
            request.fields[key.toString()] = (value is List || value is Map)
                ? jsonEncode(value)
                : value.toString();
          }
        });

        // Handle file upload if present and valid
        if (data['file'] != null && data['file'].toString().trim().isNotEmpty) {
          File file;
          if (data['file'] is String) {
            file = File(data['file']);
          } else if (data['file'] is File) {
            file = data['file'];
          } else {
            log('Invalid file format: ${data['file'].runtimeType}');
            throw Exception('File field must be a File or a String path');
          }

          // Ensure file exists and is accessible
          if (await file.exists()) {
            String filename = file.path.split('/').last;
            String extension = filename.split('.').last.toLowerCase();
            MediaType contentType;

            switch (extension) {
              case 'jpg':
              case 'jpeg':
                contentType = MediaType('image', 'jpeg');
                break;
              case 'png':
                contentType = MediaType('image', 'png');
                break;
              default:
                contentType = MediaType('application', 'octet-stream');
            }

            log('Uploading file: ${file.path}');
            request.files.add(
              await http.MultipartFile.fromPath(
                'file',
                file.path,
                filename: filename,
                contentType: contentType,
              ),
            );
          } else {
            log('File path exists but file is not found: ${file.path}');
          }
        } else {
          log('No file provided or file is empty');
        }

        log('Sending multipart request to: $url');
        final response = await request.send();
        return await http.Response.fromStream(response);
      },
      url,
      data,
    );
  }

  Future<BaseResponse> _handleRequest(
    Future<http.Response> Function() request,
    String url,
    dynamic data,
  ) async {
    try {
      final response = await request();
      log('API CALLL: $url\nREQUEST: $data \nRESPONSE: ${response.body}');
      final decodedResponse = jsonDecode(response.body);
      return BaseResponse.fromJson({
        'status': decodedResponse['status'] ?? false,
        'message': decodedResponse['message'] ?? 'No message from server',
        'data': decodedResponse['data'],
      });
    } on SocketException {
      return BaseResponse.fromJson({
        'status': false,
        'message': 'No internet connection',
        'data': null,
      });
    } on FormatException {
      return BaseResponse.fromJson({
        'status': false,
        'message': 'Invalid response format',
        'data': null,
      });
    } catch (e) {
      log('API CALL: $url\nREQUEST: $data');
      return BaseResponse.fromJson({
        'status': false,
        'message': 'Something went wrong',
        'data': null,
      });
    }
  }

  Future<BaseResponse> _handleMultipartRequest(
    Future<http.Response> Function() request,
    String url,
    dynamic data,
  ) async {
    try {
      final response = await request();
      log('API CALL: $url\nREQUEST: $data\nRESPONSE: ${response.body}');
      final decodedResponse = jsonDecode(response.body);
      return BaseResponse.fromJson({
        'status': decodedResponse['status'] ?? false,
        'message': decodedResponse['message'] ?? 'No message from server',
        'data': decodedResponse['data'],
      });
    } on SocketException {
      return BaseResponse.fromJson({
        'status': false,
        'message': 'No internet connection',
        'data': null,
      });
    } on FormatException {
      return BaseResponse.fromJson({
        'status': false,
        'message': 'Invalid response format',
        'data': null,
      });
    } catch (e) {
      log('API CALL: $url\nREQUEST: $data\nError:$e');
      return BaseResponse.fromJson({
        'status': false,
        'message': "Something Went Wrong",
        'data': null,
      });
    }
  }

  Map<String, String> _headers([String? token]) => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    if (token != null) 'Authorization': 'Bearer $token',
  };
}
