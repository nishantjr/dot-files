### MuPDF

|Key            | Command                                                      |
|---------------|--------------------------------------------------------------|
| W, H          | Fit to width / Height                                        |
| 123g          | Go to page 123                                               |
| m             | mark current page                                            |
| t             | return to last mark                                          |
| [0-9]m        | Save the current page number in the numbered register.       |
| [0-9]t        | Go to the page saved in the numbered register.               |

### Tar

Remove leading componnents from directory.

    tar xvf tarname.tar --strip-components=n

### webfs

`webfsd` is a quick a light webserver, that can be used to quickly serve
directory index and files within that directory. It's quite convienient to
quickly preview a static website, or transfer files to another device or
computer.

Install the package `webfs` on archlinux or ubuntu. Run like:

    $ cd docroot/; webfsd -p 1234

**NOTE:** On Ubuntu (and probably other debian based systems), the webfs system
service is automatically enabled at boot, serving the directory `/srv/ftp`.
To disable this run:

    echo manual | sudo tee /etc/init/webfs.override
