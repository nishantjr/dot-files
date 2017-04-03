Personal dot-files managed as a [dot-home](https://github.com/dot-home/_dot-home)
module.

## Bootstrapping

On machines with ssh access to github:

    mkdir -p ~/.home                                    &&
    cd ~/.home                                          &&
    git clone git@github.com:dot-home/_dot-home         &&
    git clone git@github.com:nishantjr/dot-files        &&
    _dot-home/bin/dot-home-setup

On machines without ssh access to github:

    mkdir -p ~/.home                                    &&
    cd ~/.home                                          &&
    git clone https://github.com/dot-home/_dot-home     &&
    git clone https://github.com/nishantjr/dot-files    &&
    _dot-home/bin/dot-home-setup
