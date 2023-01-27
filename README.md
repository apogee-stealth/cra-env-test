# CRA process.env key order issue

This repo demonstrates an issue with create-react-app where the hash of built
.js files is dependent on the order of the environment variable keys in
`process.env`.  In some environments (like Kubernetes), the order of these keys
may be non-deterministic, resulting in build outputs with different hashes even
when the source code and environment variable values are identical.

The project contains a default initial CRA app that has been ejected so that the
initial order of the keys in `process.env` can easily be asserted at build time.
Other than that, the build process has been unaltered from the CRA defaults.

## Testing

Use the `test-env-order.sh` script to reproduce the issue.  It will build the
React app two times: once with environment variables `REACT_APP_VAR1` and
`REACT_APP_VAR2` in that order, and once with their order reversed.  It will
then compare the two `main.*.js` output file names for equality.

To test the fix, uncomment the `.sort()` line in `env.js` and run again.
