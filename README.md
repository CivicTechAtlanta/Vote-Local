# Vote Local

An initiative from [Code for Atlanta](http://www.codeforatlanta.org/) members to help people get engaged in their municipalities and neighborhoods.

Currently, we're getting started with helping Atlanta residents identify their **Neighborhood Planning Units (NPU)**.

## Dependencies

This is a Ruby on Rails (RoR) project, so you'll need the standard set of tools.

See [here](http://installrails.com/) for how to install RoR on your machine.

## Getting Set Up

After cloning this repository.

```bash
# if you don't have bundle run `gem install bundle`
bundle install
```

Then,

```bash
rake db:create db:migrate
```

Run a normal Rails server with

```bash
rails server
```

## Contribution

We follow the standard [Code For Atlanta](http://www.codeforatlanta.org/) work flow:

1. Make a branch.
  * If you're not a member, fork the repo.
2. Commit your changes to your branch.
3. Push and make a pull request (PR).
4. Get a member to merge your PR.
