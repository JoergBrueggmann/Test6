# Test6

Shows how source files of a package that has been obtained from Stackage/Hackage (by stach unpack, as a local copy), and is embedded in an existing project - with using tarball files.

## Use case

One wants to use the original sources of a package (of the Stackage/Hackage repository), to modify it's files locally, and in order to investigate or contribute to improvement - with using tarball files.

Source: https://www.sw4sd.com/hasksheet/doku.php?id=toolsetup:buildingapackagelocally

See also https://github.com/JoergBrueggmann/Test7

## Procedure - with using tarball files

    unpack the package that should be obtained as source code
        command:

        stack unpack random

        or command with dedicated version number:

        stack unpack random-1.2.1

        output:

        Unpacked random (from Hackage) to C:\Qsync\SwEng\GitHub\JB\SandBox\Test6\random-1.2.1\

    change the current directory
        command:

        cd random-1.2.1

    initialise the folder of the package (here `random-1.2.1`), will create file `stack.yaml`
        command:

        stack init

        output:

        Looking for .cabal or package.yaml files to use to init the project.
        Using cabal packages:
        - .\

        Selecting the best among 20 snapshots...

        * Matches https://raw.githubusercontent.com/commercialhaskell/stackage-snapshots/master/lts/18/25.yaml

        Selected resolver: https://raw.githubusercontent.com/commercialhaskell/stackage-snapshots/master/lts/18/25.yaml
        Initialising configuration using resolver: https://raw.githubusercontent.com/commercialhaskell/stackage-snapshots/master/lts/18/25.yaml
        Total number of user packages considered: 1
        Writing configuration to file: stack.yaml
        All done.

    generate a tarball file of the package code
        command:

        stack sdist

        output:

        Getting file list for C:\Qsync\SwEng\GitHub\JB\SandBox\Test6\random-1.2.1\
        random> List of package sources written to file
        random> 'C:\Users\Joerg\AppData\Local\Temp\stack-sdist-fede07f57c5e6536\source-files-list'
        Building sdist tarball for C:\Qsync\SwEng\GitHub\JB\SandBox\Test6\random-1.2.1\
        Wrote sdist tarball to C:\Qsync\SwEng\GitHub\JB\SandBox\Test6\random-1.2.1\.stack-work\dist\274b403a\random-1.2.1.tar.gz
        Checking package 'random' for common mistakes
        Package check reported the following warnings:
        'ghc-options: -O2' is rarely needed. Check that it is giving a real benefit and not just imposing longer compile times on your users.

    change the current directory back to the main one
        command:

        cd ..

    to `stack.yaml` of main project, add package with relative path (here `./random-1.2.1`) to section `extra-deps`
        extract

        .
        .
        .
        # extra-deps:
        # - acme-missiles-0.3
        # - git: https://github.com/commercialhaskell/stack.git
        #   commit: e7b331f14bcffb8367cd58fbfc8b40ec7642100a
        #
        # extra-deps: []
        extra-deps:
        - ./random-1.2.1

        # Override default flag values for local packages and extra-deps
        # flags: {}
        .
        .
        .

    to `package.yaml` of main project add dependency to package (here `random`) with constraint (here ` == 1.2.1`) to section `dependencies`
        extract

        .
        .
        .
        # common to point users to the README.md file.
        description:         Please see the README on GitHub at <https://github.com/githubuser/Test6#readme>

        dependencies:
        - base >= 4.7 && < 5
        - random == 1.2.1

        library:
          source-dirs: src
        .
        .
        .

    delete cabal-file (here `Test6.cabal`), if any

    build the main project
        command:

        stack build

        output:

        random> configure (lib)
        random> Configuring random-1.2.1...
        random> build (lib)
        random> Preprocessing library for random-1.2.1..
        random> Building library for random-1.2.1..     
        random> [1 of 4] Compiling System.Random.GFinite
        random> [2 of 4] Compiling System.Random.Internal
        random> [3 of 4] Compiling System.Random
        random> [4 of 4] Compiling System.Random.Stateful
        random> copy/register
        random> Installing library in C:\Qsync\SwEng\GitHub\JB\SandBox\Test6\.stack-work\install\f1fb6c00\lib\x86_64-windows-ghc-8.10.7\random-1.2.1-HT6KBuAXK636deJWA2IfmN
        random> Registering library for random-1.2.1..
        Building all executables for `Test6' once. After a successful build of all of them, only specified executables will be rebuilt.
        Test6 > configure (lib + exe)
        Configuring Test6-0.1.0.0...
        Test6 > build (lib + exe)
        Preprocessing library for Test6-0.1.0.0..
        Building library for Test6-0.1.0.0..
        [1 of 2] Compiling Lib
        [2 of 2] Compiling Paths_Test6
        Preprocessing executable 'Test6-exe' for Test6-0.1.0.0..
        Building executable 'Test6-exe' for Test6-0.1.0.0..
        [1 of 2] Compiling Main
        [2 of 2] Compiling Paths_Test6
        Linking .stack-work\dist\274b403a\build\Test6-exe\Test6-exe.exe ...
        Test6 > copy/register
        Installing library in C:\Qsync\SwEng\GitHub\JB\SandBox\Test6\.stack-work\install\f1fb6c00\lib\x86_64-windows-ghc-8.10.7\Test6-0.1.0.0-37H5nARYQZNVVlIIsBxXW
        Installing executable Test6-exe in C:\Qsync\SwEng\GitHub\JB\SandBox\Test6\.stack-work\install\f1fb6c00\bin
        Registering library for Test6-0.1.0.0..
        Completed 2 action(s).



## Source
https://www.sw4sd.com/hasksheet/doku.php?id=toolsetup:buildingapackagelocally
