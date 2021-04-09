import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart' as a;

/// Manipulate an `lcov.info` file to ignore files matching given patterns.
///
/// If not given a file, `stdin` will be filtered and sent to `stdout`.
///
/// Usage:
/// ```text
/// Remove files with paths matching given PATTERNs from the lcov.info FILE
/// -f, --file=<FILE>         the target lcov.info file to manipulate
/// -r, --remove=<PATTERN>    a pattern of paths to exclude from coverage
/// -h, --help                show this help
/// ```
void main(List<String> arguments) {
  final parser = a.ArgParser()
    ..addSeparator(
        'Remove files with paths matching given PATTERNs from the lcov.info FILE')
    ..addOption('file',
        abbr: 'f',
        help: 'the target lcov.info file to manipulate',
        valueHelp: 'FILE')
    ..addMultiOption('remove',
        abbr: 'r',
        splitCommas: true,
        help: 'a pattern of paths to exclude from coverage',
        valueHelp: 'PATTERN')
    ..addFlag('help',
        abbr: 'h', negatable: false, defaultsTo: false, help: 'show this help');

  final args = parser.parse(arguments);

  if (args['help']) {
    print(parser.usage);
    exit(0);
  }

  final patterns = (args['remove'] as List<String>)
      .map((s) => RegExp(s))
      .toList(growable: false);

  var keep = true;
  final keeper = (String s) {
    if (s.startsWith('SF:') &&
        patterns.any((RegExp r) => r.hasMatch(s.substring(3)))) {
      keep = false;
    } else if (!keep && s == 'end_of_record') {
      keep = true;
      return false;
    }
    return keep;
  };

  if (args['file'] == null) {
    stdin
        .transform(utf8.decoder)
        .transform(const LineSplitter())
        .where(keeper)
        .map((String s) => '$s\n')
        .transform(utf8.encoder)
        .pipe(stdout);
  } else {
    final f = File(args['file']);
    f.readAsLines().then(
        (List<String> los) => f.writeAsString(los.where(keeper).join('\n')));
  }
}
