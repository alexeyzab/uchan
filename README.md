# Uchan

[![Circle CI](https://circleci.com/gh/alexeyzab/uchan.svg?style=shield)](https://circleci.com/gh/alexeyzab/uchan)
[![Code Climate](https://codeclimate.com/github/alexeyzab/uchan/badges/gpa.svg)](https://codeclimate.com/github/alexeyzab/uchan)
[![Test Coverage](https://codeclimate.com/github/alexeyzab/uchan/badges/coverage.svg)](https://codeclimate.com/github/alexeyzab/uchan/coverage)

This is a simplified version of an anonymous imageboard (like 2chan.net, etc.)

You can view it live over at Heroku:
[uchan-heroku.herokuapp.com](https://uchan-heroku.herokuapp.com/)

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [foreman]:

    % foreman start

If you don't have `foreman`, see [Foreman's install instructions][foreman]. It
is [purposefully excluded from the project's `Gemfile`][exclude].

[foreman]: https://github.com/ddollar/foreman
[exclude]: https://github.com/ddollar/foreman/pull/437#issuecomment-41110407

## Useful Links

* [GitHub repo](https://github.com/alexeyzab/uchan)
* [Production app on Heroku](http://uchan-heroku.herokuapp.com)
* [Trello board](https://trello.com/b/RrBJnwwj/uchan)

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
