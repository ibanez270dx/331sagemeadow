# 331 Sage Meadow

Single-page real estate listing site for 331 Sage Meadow Rd, Wylie, TX — a Sinatra app serving one static-content page (`views/index.erb`).

## Requirements
- Ruby (with Bundler)

## Setup

```sh
bundle install
```

## Running locally

```sh
bundle exec rackup
```

The site will be available at `http://localhost:9292`.

## Project structure

```
app.rb          # Sinatra app, single route rendering views/index.erb
config.ru       # Rack entry point
views/
  index.erb     # Listing page markup, content, and analytics snippets
public/
  css/          # Stylesheet
  images/       # Listing photos
```

## Analytics

The site uses Mixpanel and the Meta/Facebook Pixel for tracking, both initialized client-side in `views/index.erb`. See [AGENTS.md](AGENTS.md) for event names, triggers, and conventions for adding new tracked events.
