# # NFT

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**cid** | **string** | Self-describing content-addressed identifiers for distributed systems. Check [spec](https://github.com/multiformats/cid) for more info. | [optional]
**size** | **float** | Size in bytes of the NFT data. | [optional] [default to 132614]
**created** | [**\DateTime**](\DateTime.md) | This is a timestamp in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format: YYYY-MM-DDTHH:MM:SSZ. | [optional]
**type** | **string** | MIME type of the upload file or &#39;directory&#39; when uploading multiple files. | [optional]
**scope** | **string** | Name of the JWT token used to create this NFT. | [optional] [default to 'default']
**pin** | [**\NFTStorage\Model\Pin**](Pin.md) |  | [optional]
**files** | **object[]** | Files in the directory (only if this NFT is a directory). | [optional]
**deals** | [**\NFTStorage\Model\Deal[]**](Deal.md) |  | [optional]

[[Back to Model list]](../../README.md#models) [[Back to API list]](../../README.md#endpoints) [[Back to README]](../../README.md)
