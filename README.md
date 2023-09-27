# HTTP Client for JSON Response

If your server is only responding in json format. Then package is likely fit to you. This package mainly comes with three main functions; `get()` function for GET method, `post()` function for POST method and  `multipart()` for file uploading. 

## Usage:

First of all import the package as following;
```dart
import 'package:json_response_network/json_response_network.dart' as request;
```

To send GET request to the server, you need the following code;
```dart
request.get({url: "https://example.com/somepath"});
```

To send POST request to the server, you need the following code;
```dart
request.post({
        url: "https://example.com/somepath", 
        body: {'some_field1': 'some_data1', 'some_field2':'some_data2'}
    });
```

To upload file with some other data to the server, you need the following code;
```dart
request.multipart({
        url: "https://example.com/somepath", 
        file: some_file, 
        fields: {'some_field1': 'some_data1', 'some_field2':'some_data2'
    }});
```

## Parameter Descriptions

| Parameter | Descriptions |
| --------- | ------------ |
| url       | String type  |
| headers    | Map<String, String> |
| body      | Map<String, String> |
| fields    | Map<String, String> |
| file      | FILE type  |

__NOTE :__ `headers` comes with all three above functions.
