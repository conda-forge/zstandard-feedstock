#!/bin/bash

# Otherwise this picks up the wrong linker on Linux (in most cases the system C++ compiler)
if [ $(uname) == Linux ]; then
  export LDSHARED="$CC -shared -pthread"
fi
# avoid picking up the shared library
rm $PREFIX/lib/libzstd$SHLIB_EXT*
${PYTHON} setup.py install --system-zstd --single-version-externally-managed --record=record.txt
