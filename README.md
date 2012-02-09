Litle and Co demo application using Ruby on Rails
=================================================

Prerequisites
-------------
This application requires the Litle version of the Active Merchant gem to be installed and configured to talk to a Litle environment.

Description
-----------
In this Demo Rails (v3.1.1) App, The UI for this application allows realtime generation of 6 Litle payment transactions.
	
 - Authorization
 - Capture
 - Credit
 - Sale
 - Void
 - Store (tokenization)

All of the payment transactions above are accompanied by brief overview explaining there usage.  The explanations are located directly in the demo applications UI.

NOTICE: To submit a Capture, Void, or Credit transaction you must reference the LitleTxnId from a prior transaction.

In order to run the functional and integration test:

Set the database to test mode

rake db:test:prepare

run the tests from inside the dem app file:

ruby -Itest test/../..

