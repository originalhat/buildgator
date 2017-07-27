# BG

## local usage notes

Install dependencies:

```bash
mix deps.get && yarn install
```

Start PG (if not already running):

```bash
brew services start postgresql
```

Start server:

```bash
mix phoenix.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## tests

```bash
mix tests
```

## migrations

```bash
mix ecto.gen.migration create_buildkite_table
mix ecto.migrate
```

## deployment 

Using a combined buildpack hacked together by @thewoolleyman:

```bash
cf push buildgator -b https://github.com/thewoolleyman/heroku-buildpack-elixir.git
```

## making phoenix secrets

```bash
mix phoenix.gen.secret
```
