---
layout: post
title: Casperjs automation
author: chielo@coshx.com
---

  The following example casperjs script automates the download of your account transactions from Bank of America without involving a third party.  


Setup:
-------------------
  - install casperjs (http://casperjs.org/)
  - create file download.js and paste in the script below.
  - set online\_id and online\_password with correct information
  - set checking\_account\_name with the full text of the link to your checking account which appears in BOA online banking accounts overview.  (For example, "MyAccess Checking - 0123")
  - set security\_answer to the answer of the first of your BOA security challenges. The security challenge is printed to the screen when the script is run so that may be the easiest way of finding this information.

 To run:
-------------------
 - casperjs --web-security=no download.js 


```javascript
//download.js

var online_id = "your online id" ;
var online_password = "your online password" ;
var from_date = '11/01/2012'
var to_date = '11/30/2012'
var checking_account_name = "MyAccess Checking - 0123" 
var security_answer = '42'

var casper = require('casper').create();
sign_in = "https://safe.bankofamerica.com/login/sign-in/signOnScreen.go"
casper.start(sign_in, function() {
  this.fill('form[action="/login/sign-in/entry/signOn.go"]', {
    onlineId: online_id
  }, true);
});
casper.then(function() {
  challenge_exists = this.evaluate(function() {
    return __utils__.exists('[for=tlpvt-challenge-answer]');
  });
  if(challenge_exists){
    security_question = this.getHTML('[for=tlpvt-challenge-answer]') ;
    this.echo(security_question)   ;
    this.fill('form[action="/login/sign-in/validateChallengeAnswer.go"]',{
      challengeQuestionAnswer: security_answer
    }, true) ;
  }
});
casper.then(function() {
  this.fill('form[action="/login/sign-in/validatePassword.go"]', {
    password: online_password
  }, true);
}) ;
casper.thenClick('a[id=\"'+checking_account_name+'\"]') ;
casper.thenClick('a[name="export_trans_nav_top"]') ;
casper.then(function() {
    //http://code.google.com/p/phantomjs/issues/detail?id=52
    html =  this.getHTML() ;
    domain_regex = /https:\/\/onlineeast(.).bankofamerica.com/g ;
    directory_regex = /\/cgi-bin\/ias\/A\/\d\/StatementDownloadControl/g ;
    domain =  html.match(domain_regex)[0] ;
    directory = html.match(directory_regex) ;
    download_url = domain+directory ;
    var base64contents = this.base64encode(download_url, 'POST', {
        myaction: 'Download Transactions',
        AccountSelect: 0,
        DownloadPeriod: 'stmntPeriods',
        view: 1,
        fromDate: from_date,
        toDate: to_date,
        dummyInputFieldForLabelWhichShouldNotBeRead: '',
        downloadtype: 'QuickenFmt'
    });
    var data = decode_base64(base64contents) ;
    require('fs').write('transcations', data, 'w');
});
casper.run();

//decode_base64 from http://stackoverflow.com/questions/2820249/base64-
//encoding-and-decoding-in-client-side-javascript
function decode_base64(s) {
  var e={},i,k,v=[],r='',w=String.fromCharCode;
  var n=[[65,91],[97,123],[48,58],[43,44],[47,48]];
  for(z in n){for(i=n[z][0];i<n[z][1];i++){v.push(w(i));}}
  for(i=0;i<64;i++){e[v[i]]=i;}
  for(i=0;i<s.length;i+=72){
  var b=0,c,x,l=0,o=s.substring(i,i+72);
    for(x=0;x<o.length;x++){
      c=e[o.charAt(x)];b=(b<<6)+c;l+=6;
      while(l>=8){r+=w((b>>>(l-=8))%256);}
    }
  } 
  return r;
}



