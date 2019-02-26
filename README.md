# KSE (KotOR Savegame Editor)

KSE is the save editor for KotOR and KotOR 2. This repository houses KSE's source code.

## Building KSE

In order to build KSE, Perl5 and Qt are both required. Perl for KSE, and Qt for KPF. For best results, use Perl v5.28.1 (x64) and Qt 5.11.2 (MSVC 2017 x64)

KSE requires quite a few perl modules, so install all of the following using the `cpan` command. If any fail, try downloading a package from metacpan website and building it yourself.

The following modules are needed for KSE to run and build properly

* [Data::Lazy](https://metacpan.org/pod/Data::Lazy)
* [Tk](https://metacpan.org/pod/distribution/Tk/Tk.pod)
* [Tk::Autoscroll](https://metacpan.org/pod/Tk::Autoscroll)
* [Tk::DynaTabFrame](https://metacpan.org/pod/Tk::DynaTabFrame)
* [Win32::AbsPath](https://metacpan.org/pod/Win32::AbsPath)
* [Win32::FileOp](https://metacpan.org/pod/Win32::FileOp)

With all perl modules installed and Qt installed (msvc2017) run `build.bat` to build KSE and KPF. `clean.bat` will clean KSE and KPF.

Building will output all binaries to a new `dist\` directory, which can be used for distributing KSE.

### Building a Perl Module Package

To build a module package from cpan, open a command line in the folder with the module's source, making sure `perl` works and run:

```shell
$ perl Makefile.PL
$ gmake
$ gmake install
```
