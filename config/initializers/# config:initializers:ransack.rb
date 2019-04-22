# config/initializers/ransack.rb
# http://blog.magmalabs.io/2019/03/12/searching-with-ransack-in-ruby-on-rails.html

Ransack.configure do |c|
  c.custom_arrows = {
    up_arrow: '<i class="custom-up-arrow-icon"></i>',
    down_arrow: 'U+02193',
    default_arrow: '<i class="default-arrow-icon"></i>'
  }
end