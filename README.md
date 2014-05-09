# Godville Kit
[![Gitter Chat](http://img.shields.io/badge/chat-gitter-brightgreen.svg)](https://gitter.im/kevinjalbert/godville_kit)
[![Gem Version](https://badge.fury.io/rb/godville_kit.svg)](http://badge.fury.io/rb/godville_kit)
[![Build Status](https://travis-ci.org/kevinjalbert/godville_kit.svg?branch=master)](https://travis-ci.org/kevinjalbert/godville_kit)
[![Coverage Status](https://img.shields.io/coveralls/kevinjalbert/godville_kit.svg)](https://coveralls.io/r/kevinjalbert/godville_kit?branch=master)
[![Code Climate](https://img.shields.io/codeclimate/github/kevinjalbert/godville_kit.svg)](https://codeclimate.com/github/kevinjalbert/godville_kit)
[![Dependency Status](https://img.shields.io/gemnasium/kevinjalbert/godville_kit.svg)](https://gemnasium.com/kevinjalbert/godville_kit)

## Introduction

This gem provides the functionality to query [Godville](http://godvillegame.com) for your hero's information. As [Godville](http://godvillegame.com) does not provide a public documented API, other approaches had to be explored. By observing the network activity when accessing [Godville' hero page](http://godvillegame.com/superhero), it be clear that there are HTTP API calls to acquire the hero's information.

By using these HTTP API calls it is possible to acquire a JSON response containing the hero's data. This Gem takes the JSON responses and transforms them into a cohesive object structure detailing the hero. Hopefully this provides an easier way for data collection/visualizations or whatever you wish to create.

## Example Usage
The follow shows you how to perform the authentication with [Godville's](http://godvillegame.com) servers, which then allows you to fetch your hero's data.

    require 'godville_kit

    # Create an API requester, which performs authentication and HTTP requests
    requester = GodvilleKit::APIRequester.new('user@gmail.com', 'my_password', 'hero_guid', 'pantheons_guid')

    # Fetch the current state of your hero and provides it as an object structure
    hero = requester.request_hero

### Required Data
The `APIRequester` requires four pieces of information: username/email, password, hero GUID, pantheons GUID. The first two you should already know. To acquire the GUIDs are slightly more involved. From what I understand these Globally Unique Identifier (GUID) simply reference a resource as you make the API requests. These API requests are all going to the same API endpoint, and so we require the GUIDs to make requests for hero and pantheons data.

This is all speculation on how [Godville](http://godvillegame.com) servers handle identified the resources. I have noticed that the Pantheons GUID changes through sessions, although the old GUID still provide access, so I am unsure how it exactly works, or when it will expire.

#### Hero GUID
1. Open up Chrome (this work with Firefox as well, although some details will be different)
2. Open the Developer Tools view
3. Select the Network tab
4. Open/Refresh [http://godvillegame.com/superhero](http://godvillegame.com/superhero)
5. Look for an entry similar to `feed?a=hero_guid`

#### Pantheons GUID
1. Open up Chrome (this work with Firefox as well, although some details will be different)
2. Open the Developer Tools view
3. Select the Network tab
4. Open/Refresh [http://godvillegame.com/superhero](http://godvillegame.com/superhero)
5. You need to look through the multiple `feed` entries and identify the one where the Response tab shows pantheons data.
6. Using the identified `feed` entry look at the Header tab's Form Data value `a=pantheons_guid`
