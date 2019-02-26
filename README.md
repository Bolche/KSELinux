# KSE (KotOR Savegame Editor)

KSE is the save editor for KotOR and KotOR 2. This repository houses KSE's source code.

[KSE on DeadlyStream][1]

## Building KSE

In order to build KSE, Perl5 and Qt are both required. Perl for KSE, and Qt for KPF. For best results, use Perl v5.28.1 (x64) and Qt 5.11.2 (MSVC 2017 x64)

KSE requires quite a few perl modules, so install all of the following using the `cpan` command. If any fail, try downloading a package from metacpan website and building it yourself.

The following modules are needed for KSE to run and build properly

* [Data::Lazy][2]
* [Getopt::ArgvFile][10]
* [Module::ScanDeps][11]
* [PAR::Packer][12]
* [Tk][3]
* [Tk::Autoscroll][4]
* [Tk::DynaTabFrame][5]
* [Win32::AbsPath][6]
* [Win32::FileOp][7]

With all perl modules installed and Qt installed (msvc2017) run `build.bat` to build KSE and KPF. `clean.bat` will clean KSE and KPF.

Building will output all binaries to a new `dist\` directory, which can be used for distributing KSE.

### Building a Perl Module Package

To build a module package from cpan, open a command line in the folder with the module's source, making sure `perl` works and run:

```shell
$ perl Makefile.PL
$ gmake
$ gmake install
```

## Contributors

* [FairStrides][8] - Current lead dev
* [Pazuzu156][9] - Current KSE/KPF dev
* Chev Chelios - Original KPF author
* tk102 - Original KSE author

[//]: # (Links reference)
[1]: https://deadlystream.com/files/file/503-kotor-savegame-editor/
[2]: https://metacpan.org/pod/Data::Lazy
[3]: https://metacpan.org/pod/distribution/Tk/Tk.pod
[4]: https://metacpan.org/pod/Tk::Autoscroll
[5]: https://metacpan.org/pod/Tk::DynaTabFrame
[6]: https://metacpan.org/pod/Win32::AbsPath
[7]: https://metacpan.org/pod/Win32::FileOp
[8]: https://deadlystream.com/profile/9107-fair-strides/
[9]: https://gitlab.com/pazuzu156
[10]: https://metacpan.org/pod/Getopt::ArgvFile
[11]: https://metacpan.org/pod/Module::ScanDeps
[12]: https://metacpan.org/pod/PAR::Packer
