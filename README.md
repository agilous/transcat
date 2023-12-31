# TransactionCategorization Rails App
A simple [Rails](https://rubyonrails.org/) application that categorizes banking transaction via Machine Learning (AI).

![Build Status](https://github.com/agilous/transcat/actions/workflows/ci.yml/badge.svg)

## Dependencies
* [asdf](https://asdf-vm.com/#/)
* [PostgreSQL](https://www.postgresql.org/) - Tested with PostgreSQL 14 but earlier versions should work.

## Setup
Check out the code:
```sh
git clone git@github.com:agilous/transcat.git
```
On a * nix environment, just run:
```sh
cd transcat # presuming you ran the command above and did not rename the directory
asdf install
./bin/setup
```
and you should be setup to go.

## Contributing
[How to Contribute to Open Source](https://opensource.guide/how-to-contribute/)
offer's the best advice. **Don't forget to add tests!**

### tl;dr
1. [Fork it](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo)!
1. Create your feature branch: `git checkout -b cool-new-feature`
1. Commit your changes: `git commit -am 'Added a cool feature'`
1. Push to the branch: `git push origin cool-new-feature`
1. [Create new Pull Request](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).