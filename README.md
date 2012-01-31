Litle and Co demo application using Ruby on Rails
=================================================

Prerequisites
-------------
This application requires Active Merchant to be configured.

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

NOTICE: In the Capture example we set the fields for reportgroup and ordersource with the default values of "Planets" and "ecommerce".
	In Credit, we set the ordersource with the default value of "ecommmerce"

NOTICE: To submit a Capture transaction you must reference the LitleTxnId from a prior Authorization.

