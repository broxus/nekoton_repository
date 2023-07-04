# Nekoton Repository

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

Nekoton repository package

## Installation 💻

**❗ In order to start using Nekoton Repository you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Add [nekoton_repository][pubdev_link] to your `pubspec.yaml`:

```yaml
dependencies:
  nekoton_repository:
```

## Basic usage 🛠

Setup DI:

```dart
@InjectableInit(  
  externalPackageModulesBefore: [
    ExternalModule(NekotonRepositoryPackageModule),
  ],
)  
void configureDependencies() => getIt.init();  
```

Init:

```dart
Future<void> configureNekoton() async {
  final nekotonRepository = inject<NekotonRepository>();

  await nekotonRepository.setupNekotonAndStorage(
    storage: inject<NekotonStorageService>(),
  );
}
```

## Melos magic 🪄

Using [melos](https://melos.invertase.dev/) makes it very easy to work with the project, so enjoy.

You can run any job interactively run running `melos run` and selecting needed case or directly (e.g. `melos run test`).

### Bootstrap 🏁

Melos takes care about dependencies of all packages, including managing of local-generated library version. So, just run:

```
melos bs
```

### Codegen 🦾

This thing will run all code generators for all packages:

```
$ melos run codegen
```

### Clean up 🧹

Just run commands below to clean all, including build directories and flutter projects.

```
melos clean
```

### Tests ✔️

You can run all tests at one by running this command.

```
melos run test
```

### Code 📊

You can run code analysis:

```
melos run analyze
```

### Code format 🗃️

`melos run check-format` will check, `melos run format` will fix dart code formatting.

```
melos run check-format
melos run format
```

### Prepare to commit 🤝🏻

`melos run check-all` will ckeck, analyze and run all tests.

```
melos run check-all
```

## Conventional Commits ❤️

[This magic](https://melos.invertase.dev/guides/automated-releases#versioning) will update version and build our library automatically using commit messages and tags. [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0) is a lightweight convention on top of commit messages.

## Version 🏷️

Package version control is done by melos. It runs by gh action 'Create version PR' ```melos version -a --yes```.

## Continuous Integration 🤖

Nekoton Repository comes with a built-in [GitHub Actions workflow][github_actions_link] powered by [Very Good Workflows][very_good_workflows_link] but you can also add your preferred CI/CD solution.

Out of the box, on each pull request and push, the CI `formats`, `lints`, and `tests` the code. This ensures the code remains consistent and behaves correctly as you add functionality or make changes. The project uses [Very Good Analysis][very_good_analysis_link] for a strict set of analysis options used by our team. Code coverage is enforced using the [Very Good Workflows][very_good_coverage_link].


[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
[pubdev_link]: https://pub.dev/packages/nekoton_repository
