# NFTStorage\NFTStorageAPI

All URIs are relative to https://nft.storage/api.

Method | HTTP request | Description
------------- | ------------- | -------------
[**callList()**](NFTStorageAPI.md#callList) | **GET** / | List all stored files
[**delete()**](NFTStorageAPI.md#delete) | **DELETE** /{cid} | Stop storing the content with the passed CID
[**status()**](NFTStorageAPI.md#status) | **GET** /{cid} | Get information for the stored file CID
[**store()**](NFTStorageAPI.md#store) | **POST** /upload | Store a file


## `callList()`

```php
callList(): \NFTStorage\Model\ListResponse
```

List all stored files

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: bearerAuth
$config = NFTStorage\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new NFTStorage\Api\NFTStorageAPI(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);

try {
    $result = $apiInstance->callList();
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling NFTStorageAPI->callList: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**\NFTStorage\Model\ListResponse**](../Model/ListResponse.md)

### Authorization

[bearerAuth](../../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `delete()`

```php
delete($cid): \NFTStorage\Model\DeleteResponse
```

Stop storing the content with the passed CID

Stop storing the content with the passed CID on nft.storage. - Unpin the item from the underlying IPFS pinning service. - Cease renewals for expired Filecoin deals involving the CID.    ⚠️ This does not remove the content from the network.  - Does not terminate any established Filecoin deal. - Does not remove the content from other IPFS nodes in the network that already cached or pinned the CID.    Note: the content will remain available if another user has stored the CID with nft.storage.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: bearerAuth
$config = NFTStorage\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new NFTStorage\Api\NFTStorageAPI(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$cid = 'cid_example'; // string | CID for the NFT

try {
    $result = $apiInstance->delete($cid);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling NFTStorageAPI->delete: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cid** | **string**| CID for the NFT |

### Return type

[**\NFTStorage\Model\DeleteResponse**](../Model/DeleteResponse.md)

### Authorization

[bearerAuth](../../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `status()`

```php
status($cid): \NFTStorage\Model\GetResponse
```

Get information for the stored file CID

Includes the IPFS pinning state and the Filecoin deal state.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: bearerAuth
$config = NFTStorage\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new NFTStorage\Api\NFTStorageAPI(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$cid = 'cid_example'; // string | CID for the NFT

try {
    $result = $apiInstance->status($cid);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling NFTStorageAPI->status: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cid** | **string**| CID for the NFT |

### Return type

[**\NFTStorage\Model\GetResponse**](../Model/GetResponse.md)

### Authorization

[bearerAuth](../../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `store()`

```php
store($body): \NFTStorage\Model\UploadResponse
```

Store a file

Store a file with nft.storage.  - Submit a HTTP `POST` request passing the file data in the request body. - To store multiple files in a directory, submit a `multipart/form-data` HTTP `POST` request.  Use the `Content-Disposition` header for each part to specify a filename.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');


// Configure Bearer (JWT) authorization: bearerAuth
$config = NFTStorage\Configuration::getDefaultConfiguration()->setAccessToken('YOUR_ACCESS_TOKEN');


$apiInstance = new NFTStorage\Api\NFTStorageAPI(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client(),
    $config
);
$body = "/path/to/file.txt"; // \SplFileObject

try {
    $result = $apiInstance->store($body);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling NFTStorageAPI->store: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **\SplFileObject****\SplFileObject**|  |

### Return type

[**\NFTStorage\Model\UploadResponse**](../Model/UploadResponse.md)

### Authorization

[bearerAuth](../../README.md#bearerAuth)

### HTTP request headers

- **Content-Type**: `image/png`, `application/octet-stream`, `multipart/form-data`
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
