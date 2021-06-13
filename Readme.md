# vcpkg versioning example code

This is an example C++ project that uses vcpkg versioning.

It uses two common C++ libraries. CRP (curl lib, makes http request) and rapidjson (fast json to object mapping).

## Geting started

1. Clone this repo.
2. init sub modules (where we pull in vcpkg). `git submodule update --init --recursive`
3. Boot strap vcpkg without telemetry, we don't want Bill Gates looking into our windows at night. `./vcpkg/bootstrap-vcpkg.sh -disableMetrics`
4. Install dependencies. (`./vcpkg/vcpkg --feature-flags=versions install`)
5. Configure and compile with cmake. `cmake -B build/ . && cmake --build build/`
6. Run with `./build/consumer kafka:9092 test admin admin-secret`

## Other Notes

**Compile in production mode**:

```bash
        cmake  -B build/ . && cmake -DCMAKE_BUILD_TYPE=Release --build build/;
        cd build;
        make;
```
