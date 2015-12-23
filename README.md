CPLEX.jl
========

The CPLEX.jl package provides an interface for using [IBM's CPLEX Optimizer™](http://www.ibm.com/software/commerce/optimization/cplex-optimizer/) from the [Julia language](http://julialang.org/). You cannot use CPLEX.jl without having purchased and installed a copy of CPLEX Optimizer™ from [IBM](http://www.ibm.com/). This package is available free of charge and in no way replaces or alters any functionality of IBM's CPLEX Optimizer product.

CPLEX.jl is a Julia interface for the CPLEX optimization software. CPLEX functionality is extensive, so coverage is incomplete, but the basic functionality for solving linear and mixed-integer programs is provided.

CPLEX.jl is intended for use with the [MathProgBase](https://github.com/JuliaOpt/MathProgBase.jl) solver interface; an internal API, while present, is not documented.

Setting up CPLEX on OS X and Linux
----------------------------------

NOTE: CPLEX [does not officially support linking to their dynamic C library](https://www.ibm.com/developerworks/community/forums/html/topic?id=ca96447c-fe2d-4e8a-900e-cfe358a9bcec&ps=25), which is necessary for use from Julia. However, the steps outlined below have worked for OS-X, Windows, and Linux machines.

1. First, you must obtain a copy of the CPLEX software and a license; trial versions and academic licenses are available [here](http://www-01.ibm.com/software/websphere/products/optimization/cplex-studio-preview-edition/).

2. Once CPLEX is installed on your machine, point the LD_LIBRARY_PATH variable to the CPLEX bin by adding ``export LD_LIBRARY_PATH="/path/to/CPLEX/bin":$LD_LIBRARY_PATH``(Example: LD_LIBRARY_PATH="/opt/ibm/ILOG/CPLEX_Studio125/cplex/bin/x86-64_sles10_4.1") to your start-up file (e.g. ``.bash_profile``, [adding library path on Ubuntu](http://stackoverflow.com/questions/13428910/how-to-set-the-environmental-variable-ld-library-path-in-linux for a)).

3. At the Julia prompt, run
  ```
  julia> Pkg.add("CPLEX")
  ```
(or manually clone this module to your ``.julia`` directory).

4. Check that your version is included in ``deps/build.jl`` in the aliases for the library dependency; if not, open an issue.

Note on parameters
------------------

CPLEX has a large range of parameters that can be tuned to change the solvers behavior in many stages of the optimization process. CPLEX.jl includes an automatically generated list of parameters that are accessible for use. However, this list has last been generated with CPLEX version 12.6.2, and there are some differences with previous versions. For this reason, take care when setting solver parameters on earlier versions of CPLEX.

Note for windows
----------------

Currently, CPLEX.jl is compatible only with 64-bit CPLEX and 64-bit Julia on Windows. CPLEX.jl attemps to automatically find the CPLEX library based on the ``CPLEX_STUDIO_BINARIES`` environmental variable set by the CPLEX installer.
