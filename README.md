Litle and Co demo application using Ruby on Rails
=================================================

Prerequisites
-------------
This application utilizes the Litle Certification system.  In order to run tests you need to have access enabled to our systems for your source IP addresses.

The certification environment is reached at: https://cert.litle.com/vap/communicator/online

Description
-----------
In this Demo Rails (v3.1.1) App, we describe and enable test 6 Litle payment transactions.
	-Authorization
	-AuthReversal
	-Capture
	-Credit
	-Sale
	-Void

All the payment transactions are acompanied by an explanation in the Web app.

NOTICE: In the Capture example we set the fields for reportgroup and ordersource with the default values of "Planets", "ecommerce".
	In Credit, we set the ordersource as default value with "ecommmerce"

NOTICE: To submit a Capture transaction you must reference the LitleTxnId from an prior Authorization.

