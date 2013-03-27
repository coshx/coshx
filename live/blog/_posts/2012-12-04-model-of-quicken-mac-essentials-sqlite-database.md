---
layout: post
title: Model of Quicken Mac Essentials Sqlite database
author: chielo@coshx.com
---
 A rough model of Quicken Mac Essentials sqlite database using ActiveRecord without rails


Setup:
-------------------
  - Ruby 1.9.3 on OSX
  - gem install activerecord
  - gem install sqlite
  - Copy the sqlite file containing your transactions into a local working directory.  <br>
The sqlite file is appropriately named data and within the user file (for example mydata.quickendata/data). 
  - Copy and paste the ruby script below into script.rb which should be contained within the same local working directory as the copy of the database file. 

To Run (prints transactions):
-------------------
 - ruby script.rb

```ruby
#script.rb

require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3", 
  :database => "data"
)

class FIPayee < ActiveRecord::Base
  self.table_name =  "ZFIPAYEE"
  def name
    self.ZNAME
  end
end

class Payee < ActiveRecord::Base
  self.table_name =  "ZUSERPAYEE"
  def name
    self.ZNAME
  end
end

class Account < ActiveRecord::Base
  self.table_name =  "ZACCOUNT"
  def name
    self.ZNAME
  end
end

class Category < ActiveRecord::Base
  self.table_name =  "ZTAG"
  def name
    self.ZNAME
  end
  def parent
    self.ZPARENTCATEGORY
  end
end

class CategoryTransaction < ActiveRecord::Base
  self.table_name =  "ZCASHFLOWTRANSACTIONENTRY"

  def category_id
    self.ZCATEGORYTAG
  end

  def transaction_id
    self.ZPARENT
  end
end

class Transaction < ActiveRecord::Base
  self.table_name = "ZTRANSACTION"

  def amount
    self.ZAMOUNT.round(2)
  end

  def account_id
    self.ZACCOUNT
  end

  def payee_id
    self.ZUSERPAYEE
  end

  def fipayee_id
    self.ZFIPAYEE
  end

  def date
    posted_date || entered_date
  end

  private
  def posted_date
    return nil if self.ZPOSTEDDATE.nil?
    Time.at(self.ZPOSTEDDATE+978307200).strftime("%Y-%m-%d")
  end

  def entered_date
    return nil if self.ZENTEREDDATE.nil?
    Time.at(self.ZENTEREDDATE+978307200).strftime("%Y-%m-%d")
  end

end

#use model to print transactions to screen.
CategoryTransaction.find(:all).each do |ct|
  begin
    transaction = Transaction.find(ct.transaction_id)
    category = Category.find(ct.category_id).name
    account = Account.find(transaction.account_id).name
    date = transaction.date
    amount = transaction.amount
    payee = String.new
    if !transaction.payee_id.nil?
      payee = Payee.find(transaction.payee_id).name[0..30]
    else
      payee = FIPayee.find(transaction.fipayee_id).name[0..30]
    end
    puts "#{account}, #{date}, #{amount}, #{category}, #{payee}"
  rescue ActiveRecord::RecordNotFound => e ;
    puts ct.inspect 
  end
end


```
