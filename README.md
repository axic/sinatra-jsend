Sinatra::JSend
==============

JSend output helper for [Sinatra](http://sinatrarb.com). Extends Sinatra to support the [JSend proprosal](http://labs.omniti.com/labs/jsend).

Depends on the Sinatra::JSON helper from Sinatra-Contrib.


Installation
------------

System install

```bash
gem install sinatra-jsend
```

Gemfile

```ruby
gem 'sinatra-jsend', :require => 'sinatra/jsend'
```

Usage
-----

Classic:

```ruby
require "sinatra"
require "sinatra/jsend"

get '/' do
  jsend_fail({ :title => "A title is required" }) if params[:title] == nil
  jsend_success({ :post => { :id => 1, :title => "First entry" } })
end
```

Modular:

```ruby
require "sinatra/base"
require "sinatra/jsend"

class MyApp < Sinatra::Base
  helpers Sinatra::JSend

  get '/' do
    jsend_fail({ :title => "A title is required" }) if params[:title] == nil
    jsend_success({ :post => { :id => 1, :title => "First entry" } })
  end
end
```

Links
-----

* [Sinatra](http://www.sinatrarb.com)
* [Sinatra-Contrib](http://github.com/sinatra/sinatra-contrib)
* [JSend](http://labs.omniti.com/labs/jsend)

License
-------

See LICENSE for details.
