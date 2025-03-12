#!/bin/bash

# Otherwise this picks up the wrong linker on Linux (in most cases the system C++ compiler)
if [ $(uname) == Linux ]; then
  export LDSHARED="$CC -shared -pthread"
fi
# avoid picking up the shared library
export CFLAGS="${CFLAGS} -DZSTD_STATIC_LINKING_ONLY -DZDICT_STATIC_LINKING_ONLY"
${PYTHON} setup.py install --system-zstd --single-version-externally-managed --record=record.txt
