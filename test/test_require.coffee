eco       = require "../lib/eco"
{fixture} = require "./lib/fixtures"

module.exports =
  "requiring eco templates as modules": (test) ->

    hello = require "./fixtures/hello.eco"
    test.ok typeof hello is "function"
    test.same fixture("hello.out.1"), hello name: "Sam"

    test.done()

