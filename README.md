# SwaggerResource

### Setting up your environment

using: ruby 1.9.3

    gem install bundler
    bundle install

    if you want a clean run of the tests against a remote api,
    get an api_key from an app on fedapi.com
    then delete the existing recorded http interactions
      `rm -rf features/support/fixtures/cassettes`
    then run the tests once like so:
      FEDAPI_APIKEY=<NEW API KEY> cucumber
    and check in the changed fixtures.
    (dont' worry; it won't remember your key)
