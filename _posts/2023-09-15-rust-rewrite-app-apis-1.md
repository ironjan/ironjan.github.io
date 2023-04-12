---
title: App API Rewrite in Rust 1
author: ironjan
date: 2020-09-15T00:15:00+00:00
layout: post
categories:
  - All
  - Programming
  - Projects
---

### Motivation

My two Android apps Metal Only and MensaUPB require some kind of online service to get their data from and - since I cannot force users to update apps easily - I wrote my own API as a wrapper to the upstream APIs provided by [https://www.metal-only.de/](https://www.metal-only.de/) and [https://studierendenwerk-pb.de/](https://studierendenwerk-pb.de/). That way, whenever one of these pages changes their API, I can just adapt the wrapper and keep my own API backwards-compatible so the apps themselves don't require any updates.

The current version of the API was developed with [Play! Scala](https://www.playframework.com/). However, due to my interest in the [Rust programming language](https://www.rust-lang.org/) I considered a rewrite. An additional advantage of switching to Rust would be the potential of switching to running the app on-demand instead of keeping it always running: a restart of the current Play! Scala API takes around 3~5 seconds.

### Plan

The rewrite will be split in multiple phases due to limitted time. 

The **Experimental Phase** will just consist of developing multiple proof of concepts to see how viable using Rust for the rewrite is. This entails querying upstream APIs and providing a REST API which can be used by my apps.

In the **Cleanup Phase** unused endpoints of the current API will be removed which is useful even without a rewrite. The fastest way to do this cleanup was quite simple:

  - Add a logging plugin to the heroku app and enable email alerts whenever the app serve a "HTTP 404 Not Found" error
  - Remove all duplicate and deprecated routes which are unused by current versions of my apps
  - Re-add all routes that turn out to be still required, i.e. valid requests that produced a HTTP 404
 
The **Rewrite Phase** is most likely over-engineered and consists of two parts: an integration test and the actual apps. The integration test is used to ensure that the rewrite works as the currently existing app which is currently *tested in production*. The basic idea here is to replace the upstream APIs with simulated data ("mocks"). The first step here was to make the upstream API configurable.

Since there was never a requirement to replace the upstream API's URL, there was no option to do so. The option was added as an environment variable and - if the environment variable is not set - defaults to the hard-coded URL (pseudo-code):

```
url = get_environment_variable("UPSTREAM_URL")
if is_not_set(url) {
  url = DEFAULT_UPSTREAM_URL
}
```

Additionally, I wanted to use this rewrite to further my skills with Docker and docker-compose: the rewritten API, the current API, the integration test, and the mocked upstream APIs should all be started with a single command, i.e. `docker-compose up app-api-rewrite`.

### Current State

The rewrite started in March 2023 and was paused for a few months. While experimenting and cleaning up were done quite fast, the rewrite itself is still in progress. One of the major factors is the deliberate over-engineering.