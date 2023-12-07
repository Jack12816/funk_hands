Funk Hands
==========

**Heads up!** Funk Hands is a updated fork of the [Jazz
Hands](https://github.com/nixme/jazz_hands) project.

Spending hours in the rails console? Spruce it up and show off those
hard-working hands!

**funk_hands** is an opinionated set of console-related gems and a bit of glue:

* [**Pry**][pry] for a powerful shell alternative to IRB.
* [**Pry Rails**][pry-rails] for additional commands (`show-routes`,
  `show-models`, `show-middleware`) in the Rails console.
* [**Pry Remote**][pry-remote-reloaded] to connect remotely to a Pry console.
* [**Pry Byebug**][pry-byebug-reloaded] to turn the console into a debugger.

## Usage

Ruby 2.0+, Rails 5+. Add to your project Gemfile:

```ruby
group :development, :test do
  gem 'funk_hands'
end
```

That's it. Run `rails console` as usual.

## Contributing

Patches and bug reports are welcome. Just send a [pull request][pullrequests] or
file an [issue][issues]. [Project changelog][changelog].

[pry]:                    http://pry.github.com
[pry-rails]:              https://github.com/rweng/pry-rails
[pry-byebug-reloaded]:    https://github.com/Jack12816/pry-byebug-reloaded
[pry-remote-reloaded]:    https://github.com/Jack12816/pry-remote-reloaded
[pullrequests]:           https://github.com/Jack12816/funk_hands/pulls
[issues]:                 https://github.com/Jack12816/funk_hands/issues
[changelog]:              https://github.com/Jack12816/funk_hands/blob/master/CHANGELOG.md
