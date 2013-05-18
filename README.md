# TheDude-Web

Adds basic web integration to [TheDude](https://github.com/adamphillips/the_dude).

This consists of including some useful web libraries including Capybara,
net/http and Nokogiri so that they can be used in Dude commands.

### Capybara

TheDude is configured to use Capybara
This means that you can use Capybara DSL shortcuts in your dude commands

```ruby
command 'a web script' do
  Capybara.app_host = 'http://www.google.com'
  visit '/'
end
```

By default this will use the selenium driver however other Capybara drivers
can be configured as per the instructions in the [Capybara
readme](https://github.com/jnicklas/capybara)

### Installing

Simply install the gem using

```shell
$ gem install the_dude-web
```

The dude should detect the plugin and initialize it automatically. In order to
check that the plugin is installed you can type

```shell
$ dude list plugins
```
