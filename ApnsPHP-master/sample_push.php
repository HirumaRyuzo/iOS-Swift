<?php
/**
 * @file
 * sample_push.php
 *
 * Push demo
 *
 * LICENSE
 *
 * This source file is subject to the new BSD license that is bundled
 * with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://code.google.com/p/apns-php/wiki/License
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to aldo.armiento@gmail.com so we can send you a copy immediately.
 *
 * @author (C) 2010 Aldo Armiento (aldo.armiento@gmail.com)
 * @version $Id$
 */

// Adjust to your timezone
date_default_timezone_set('Asia/Tokyo');

// Report all PHP errors
error_reporting(-1);

// Using Autoload all classes are loaded on-demand
require_once 'ApnsPHP/Autoload.php';

// Instantiate a new ApnsPHP_Push object
$push = new ApnsPHP_Push(
	ApnsPHP_Abstract::ENVIRONMENT_SANDBOX,
	// 'server_certificates_bundle_sandbox.pem'
	'certificates/server_certificates_sandbox.pem' // 変更箇所1
);

// Set the Provider Certificate passphrase
// $push->setProviderCertificatePassphrase('test');

// Set the Root Certificate Autority to verify the Apple remote peer
// $push->setRootCertificationAuthority('entrust_root_certification_authority.pem');
$push->setRootCertificationAuthority('certificates/entrust_root_certification_authority.pem'); // 変更箇所2

// Connect to the Apple Push Notification Service
$push->connect();

try{
// Instantiate a new Message with a single recipient
// $message = new ApnsPHP_Message('1e82db91c7ceddd72bf33d74ae052ac9c84a065b35148ac401388843106a7485');
$message = new ApnsPHP_Message('a23e0027d60d48e85fd77468170c0a5e8a3eca3002d43b66c421c6e5894d4a79'); // 変更箇所3

// Set a custom identifier. To get back this identifier use the getCustomIdentifier() method
// over a ApnsPHP_Message object retrieved with the getErrors() message.
$message->setCustomIdentifier("Message-Badge-3");

// Set badge icon to "3"
$message->setBadge(3);

// Set a simple welcome text
$message->setText('Hello APNs-enabled device!');

// Play the default sound
$message->setSound();

// Set a custom property
$message->setCustomProperty('acme2', array('bang', 'whiz'));

// Set another custom property
$message->setCustomProperty('acme3', array('bing', 'bong'));

// Set the expiry value to 30 seconds
$message->setExpiry(30);

// Add the message to the message queue
$push->add($message);

// Send all messages in the message queue
$push->send();
    
}catch(ApnsPHP_Message_Exception $e){
    print_r( $e->getMessage() );}

// Disconnect from the Apple Push Notification Service
$push->disconnect();

// Examine the error message container
$aErrorQueue = $push->getErrors();
if (!empty($aErrorQueue)) {
	var_dump($aErrorQueue);
}
