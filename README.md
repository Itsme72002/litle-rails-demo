Litle and Co demo webapp using Ruby on Rails
=================================================

About Litle
------------
[Litle &amp; Co.](http://www.litle.com) powers the payment processing engines for leading companies that sell directly to consumers through  internet retail, direct response marketing (TV, radio and telephone), and online services. Litle & Co. is the leading, independent authority in card-not-present (CNP) commerce, transaction processing and merchant services.

Prerequisites
-------------
This application requires Both the activemerchant and LitleOnline ruby gems 

Setup
-----
1) Make sure that Rails and SQLite3 database are installed

2) Run the setup for the LitleOnline gem

> Setup.rb

3) Install the Litle rails demo from git. 

>git clone git://github.com/LitleCo/litle-rails-demo.git

4) Start the rails application

> rake db:create
> rake db:migrate
> rails s

5) navigate to localhost:3000 inside a web browser to view the web application

6) From the home page you may demo any transaction and view existing transactions by clicking on any of the six transaction types.

Description
-----------
The UI for this application allows realtime generation of 6 Litle payment transactions.
	
 - Authorization
 - Capture
 - Credit
 - Sale
 - Void
 - Store (tokenization)


