## Urgents

Worker for deliverig test notifications for given list of
email addresses

[![Code Climate](https://codeclimate.com/github/fs/urgent-emails.png)](https://codeclimate.com/github/fs/urgent-emails)

Dependencies
- Ruby 2.1.0
  - `rbenv install 2.1.0`

Quick Start
-

Clone this repo:

```
git clone git@github.com:fs/urgent-emails.git
cd urgents
```

Run bootstrap script

```
bin/bootstrap
```

Scripts
-

* `bin/bootstrap` - setup required gems and migrate db if needed
* `bin/ci` - should be used in the CI to run specs
* `bin/encrypt` - script for encrypting/decrypting `lib/emails.text` file

Documentation & Examples
-

[How to update the list of receivers](doc/HOW_TO_UPDATE_EMAILS.md)
