# Example Project
Given here is an example project that can use `remove_from_coverage` to fix its coverage data in `coverage/lcov.info`.

### Project Explanation
In `lib`, `name.dart` contains a Name class that stores a first, middle, and last name. Since we want Name to be an immutable value class, it makes use of the excellent [`built_value`](https://pub.dev/packages/built_value) package to automatically generate a `toString` method, `==` operator, and builder.

`built_value` does its code generation in another file, `name.g.dart`, using Dart's [part](https://stackoverflow.com/questions/27763378/when-to-use-part-part-of-versus-import-export-in-dart) mechanic to link it to `name.dart`.

We can trigger the code generation with the following command:

```bash
pub run build_runner build
```

In `test`, `name_test.dart` covers the functionality we desire from this package.

### The Problem
Our test in `name_test.dart` is sufficient for our testing of `name.dart`, but code coverage packages would also evaluate the coverage of `name.g.dart`. There might be cases where we'd want to test everything in that generated file, but if we don't, that generated file might have very few lines covered.

Suppose we use the [`test_coverage`](https://pub.dev/packages/test_coverage) package to generate coverage statistics:

```bash
pub run test_coverage
```

> Note! Since this example was created, `test_coverage` has been updated and now directly supports glob-based exclusion

We're told that the code coverage is only 46% and the output `lcov.info` file is saved to the `coverage` directory.

### The Solution

We can use `remove_from_coverage` to strip out undesired data from the `lcov.info` file, so that any reports generated from it will properly reflect the coverage.

If [`pub global` scripts are on your path](https://dart.dev/tools/pub/cmd/pub-global#running-a-script-from-your-path), you can use the following:

```bash
remove_from_coverage -f coverage/lcov.info -r '.g.dart$'
```

Otherwise, [you can use the following](https://dart.dev/tools/pub/cmd/pub-global#running-a-script-using-pub-global-run):

```bash
pub global run remove_from_coverage:remove_from_coverage -f coverage/lcov.info -r '.g.dart$'
```

Now, `lcov.info` shows only the files we desire, so any reports/percentages generates from it will now be correct.

> In general, note that generated files should not be added to source control as I've done here. I added `name.g.dart` and `.test_coverage.dart` so the example can be browsed online.
>
> Similarly, the entire coverage `directory` is not often necessary to add to source control.