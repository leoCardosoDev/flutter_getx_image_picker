import 'dart:io';

import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

import 'policy.dart';

class AwsS3 {
  static Future<String> uploadFile(
      {String accessKey,
      String secretKey,
      String bucket,
      String destDir,
      String region = 'us-east-1',
      File file,
      String filename}) async {
    final endpoint = 'https://$bucket.s3.amazonaws.com';
    final uploadDest = '$destDir/${filename ?? path.basename(file.path)}';

    final stream = http.ByteStream(Stream.castFrom(file.openRead()));
    final length = await file.length();

    final uri = Uri.parse(endpoint);
    final req = http.MultipartRequest("POST", uri);
    final multipartFile = http.MultipartFile('file', stream, length,
        filename: path.basename(file.path));

    final policy = Policy.fromS3PresignedPost(
        uploadDest, bucket, accessKey, 15, length,
        region: region);
    final key =
        SigV4.calculateSigningKey(secretKey, policy.datetime, region, 's3');
    final signature = SigV4.calculateSignature(key, policy.encode());

    req.files.add(multipartFile);
    req.fields['key'] = policy.key;
    req.fields['X-Amz-Credential'] = policy.credential;
    req.fields['X-Amz-Algorithm'] = 'AWS4-HMAC-SHA256';
    req.fields['X-Amz-Date'] = policy.datetime;
    req.fields['Policy'] = policy.encode();
    req.fields['X-Amz-Signature'] = signature;

    try {
      final res = await req.send();

      if (res.statusCode == 204) {
        return '$endpoint/$uploadDest';
      } else {
        return 'error';
      }
    } catch (e) {
      return 'error';
    }
  }
}
