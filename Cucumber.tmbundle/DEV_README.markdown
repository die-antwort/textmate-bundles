For Developers Only
===================

If you are just using this bundle then this file is not for you!

Running Specs
-------------

This project relies on rvm and bundler for doing development. Its suggested you use the .rvmrc.sample file to set a project environment then

1. install bundler
1. run bundle install

Now you should be able to run both

1. `rake spec`
1. `spec support/spec`

Upgrading to RSpec 2
--------------------

If you have been working on this project using rspec1 then its important when  upgrading to rspec2, to use a separate gemset and install all gems from scratch, to avoid any pollution from the old gemset.

* modify .rvmrc file (change the gemset e.g. to xxx_rspec2)
* cd out and back into folder
* check no gems are installed `gem list --local`
* `gem install bundler`
* `bundle install` 

Now if things don't work we know its our fault