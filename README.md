# NFTStorage

_This client was generated via the OpenAPI schema and is experimental, unsupported, and may not work at all!_

No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)


## Product Decommission Notice

### Important Update

Hello from NFT.Storage!

As of June 30, 2024, we have officially decommissioned NFT.Storage Classic uploads. This means that NFT.Storage Classic, including NFTUp, the Classic web app, Classic APIs, Classic SDK, and Pinning API, will no longer accept new uploads/pins.

### What This Means for You

**Service Termination:** NFT.Storage Classic will no longer accept new uploads. However, retrieval of existing data remains operational.

**Data Access:** Don't forget, we're still keeping a copy of your NFT.Storage Classic data available in the NFT.Storage Gateway and in the decentralized Filecoin Network. However, over time, latency and availability may degrade.

**Support:** We’ll be working with the newly formed NFT.Storage community to determine what changes, if any, will impact NFT.Storage Classic data latency and availability in the future. Join the community [Join the community](https://nft.storage/join-us) to have your say. We will keep you informed by email and on Twitter/X.

### Transition to the New Version

For the new version of NFT.Storage, first mint your NFTs, then send us the NFT data—metadata and imagery CIDs, blockchain(s) minted on, contract address, and token IDs. We will preserve these in long-term Filecoin storage. Note that you need to upload the data to IPFS separately. Your NFTs will also be included in the NFT Token Checker, a tool for block explorers, marketplaces, and wallets to show verification that NFT collections, tokens, and CIDs are preserved by NFT.Storage.

### Recommended Hot Storage Alternatives

We’re excited to announce our partnerships with Pinata and Lighthouse for hot storage solutions. As an NFT.Storage user, you support our platform when you choose Pinata and Lighthouse and use our referral links, helping to sustain our valuable public goods. [Learn more here](https://nft.storage/blog/announcing-our-new-partnerships-with-pinata-and-lighthouse).

**Pinata:** Offers flexible plans and powerful, easy-to-use tools for managing your data on IPFS. Use code NFTSTORAGE50 at checkout to enjoy 50% off your first month. [Sign up today](https://pinata.cloud).

**Lighthouse:** An IPFS provider with unique payment options for NFT longevity. They offer affordability and flexibility for all your IPFS needs, including a pay-once and store-forever option. [Sign up today](https://lighthouse.storage).

### Contact Us

For any questions or assistance, contact us [contact us](https://nft.storage/contact-us). Together, we look forward to a promising future for NFT.Storage and the broader NFT ecosystem.

Best regards,  
The NFT.Storage Team



## Installation & Usage

### Requirements

PHP 7.2 and later.

### Composer

To install the bindings via [Composer](https://getcomposer.org/), add the following to `composer.json`:

```json
{
  "repositories": [
    {
      "type": "vcs",
      "url": "https://github.com/nftstorage/php-client.git"
    }
  ],
  "require": {
    "nftstorage/php-client": "*@dev"
  }
}
```

Then run `composer install`

### Manual Installation

Download the files and include `autoload.php`:

```php
<?php
require_once('/path/to/NFTStorage/vendor/autoload.php');
```

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

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
$before = 2020-07-27T17:32:28Z; // \DateTime | Return results created before provided timestamp
$limit = 10; // int | Max records to return

try {
    $result = $apiInstance->callList($before, $limit);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling NFTStorageAPI->callList: ', $e->getMessage(), PHP_EOL;
}

```

## API Endpoints

All URIs are relative to *https://api.nft.storage*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*NFTStorageAPI* | [**callList**](docs/Api/NFTStorageAPI.md#calllist) | **GET** / | List all stored files
*NFTStorageAPI* | [**delete**](docs/Api/NFTStorageAPI.md#delete) | **DELETE** /{cid} | Stop storing the content with the passed CID
*NFTStorageAPI* | [**status**](docs/Api/NFTStorageAPI.md#status) | **GET** /{cid} | Get information for the stored file CID
*NFTStorageAPI* | [**store**](docs/Api/NFTStorageAPI.md#store) | **POST** /upload | Store a file

## Models

- [Deal](docs/Model/Deal.md)
- [DeleteResponse](docs/Model/DeleteResponse.md)
- [ErrorResponse](docs/Model/ErrorResponse.md)
- [ErrorResponseError](docs/Model/ErrorResponseError.md)
- [ForbiddenErrorResponse](docs/Model/ForbiddenErrorResponse.md)
- [ForbiddenErrorResponseError](docs/Model/ForbiddenErrorResponseError.md)
- [GetResponse](docs/Model/GetResponse.md)
- [Links](docs/Model/Links.md)
- [LinksFile](docs/Model/LinksFile.md)
- [ListResponse](docs/Model/ListResponse.md)
- [NFT](docs/Model/NFT.md)
- [Pin](docs/Model/Pin.md)
- [PinStatus](docs/Model/PinStatus.md)
- [UnauthorizedErrorResponse](docs/Model/UnauthorizedErrorResponse.md)
- [UnauthorizedErrorResponseError](docs/Model/UnauthorizedErrorResponseError.md)
- [UploadResponse](docs/Model/UploadResponse.md)

## Authorization

### bearerAuth

- **Type**: Bearer authentication (JWT)

## Tests

To run the tests, use:

```bash
composer install
vendor/bin/phpunit
```

## Author



## About this package

This PHP package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: `1.0`
- Build package: `org.openapitools.codegen.languages.PhpClientCodegen`
