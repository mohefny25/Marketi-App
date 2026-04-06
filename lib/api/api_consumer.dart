abstract class ApiConsumer{

Future get(
    String path,{Object? data,Map<String,dynamic>? queryParameters}
    );
Future post(
    String path, {Object? data,Map<String,dynamic>? queryParameters,
    bool isFormData=false}
    );
Future patch(
    String path, {Object? data,Map<String,dynamic>? queryParameters,
    bool isFormData=false}
    );
Future delete(
    String path, {Object? data,Map<String,dynamic>? queryParameters,
    bool isFormData=false}
    );
}