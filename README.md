# Garage

[![Build Status](https://travis-ci.org/sebarmano/garage.svg?branch=master)]
(https://travis-ci.org/sebarmano/garage)
[![Code Climate](https://codeclimate.com/github/sebarmano/garage/badges/gpa.svg)]
(https://codeclimate.com/github/sebarmano/garage)


Ruby on Rails work in progress application to manage a car repair shop. The main
features are:

- Appointment management with booking and confirmation from an admin.
- Customer cars and personal data regitration.
- Email/SMS confirmation and reminders for appointments.
- Employees management with task management based on appointments.
- Reporting tool for jobs done, revenues, replacements inventory, etc.
- Internationalization/localization as the app is primarily going to be used by
  a shop in a Spanish speaking country.

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

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
