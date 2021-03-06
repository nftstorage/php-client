<?php
/**
 * PinStatus
 *
 * PHP version 7.2
 *
 * @category Class
 * @package  NFTStorage
 * @author   OpenAPI Generator team
 * @link     https://openapi-generator.tech
 */

/**
 * NFT Storage API
 *
 * No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)
 *
 * The version of the OpenAPI document: 1.0
 * Generated by: https://openapi-generator.tech
 * OpenAPI Generator version: 5.1.1-SNAPSHOT
 */

/**
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

namespace NFTStorage\Model;
use \NFTStorage\ObjectSerializer;

/**
 * PinStatus Class Doc Comment
 *
 * @category Class
 * @package  NFTStorage
 * @author   OpenAPI Generator team
 * @link     https://openapi-generator.tech
 */
class PinStatus
{
    /**
     * Possible values of this enum
     */
    const QUEUED = 'queued';
    const PINNING = 'pinning';
    const PINNED = 'pinned';
    const FAILED = 'failed';
    
    /**
     * Gets allowable values of the enum
     * @return string[]
     */
    public static function getAllowableEnumValues()
    {
        return [
            self::QUEUED,
            self::PINNING,
            self::PINNED,
            self::FAILED,
        ];
    }
}


