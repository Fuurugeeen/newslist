// ignore_for_file: directives_ordering
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:drift_dev/integrations/build.dart' as _i2;
import 'package:freezed/builder.dart' as _i3;
import 'package:json_serializable/builder.dart' as _i4;
import 'package:mockito/src/builder.dart' as _i5;
import 'package:source_gen/builder.dart' as _i6;
import 'dart:isolate' as _i7;
import 'package:build_runner/build_runner.dart' as _i8;
import 'dart:io' as _i9;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(r'drift_dev:preparing_builder', [_i2.preparingBuilder],
      _i1.toDependentsOf(r'drift_dev'),
      hideOutput: true, appliesBuilders: const [r'drift_dev:cleanup']),
  _i1.apply(r'drift_dev:drift_dev', [_i2.moorBuilder],
      _i1.toDependentsOf(r'drift_dev'),
      hideOutput: true,
      appliesBuilders: const [r'source_gen:combining_builder']),
  _i1.apply(r'drift_dev:not_shared', [_i2.moorBuilderNotShared],
      _i1.toNoneByDefault(),
      hideOutput: false),
  _i1.apply(r'freezed:freezed', [_i3.freezed], _i1.toDependentsOf(r'freezed'),
      hideOutput: false),
  _i1.apply(r'json_serializable:json_serializable', [_i4.jsonSerializable],
      _i1.toDependentsOf(r'json_serializable'),
      hideOutput: true,
      appliesBuilders: const [r'source_gen:combining_builder']),
  _i1.apply(
      r'mockito:mockBuilder', [_i5.buildMocks], _i1.toDependentsOf(r'mockito'),
      hideOutput: false),
  _i1.apply(r'source_gen:combining_builder', [_i6.combiningBuilder],
      _i1.toNoneByDefault(),
      hideOutput: false, appliesBuilders: const [r'source_gen:part_cleanup']),
  _i1.applyPostProcess(r'source_gen:part_cleanup', _i6.partCleanup),
  _i1.applyPostProcess(r'drift_dev:cleanup', _i2.moorCleanup)
];
void main(List<String> args, [_i7.SendPort? sendPort]) async {
  var result = await _i8.run(args, _builders);
  sendPort?.send(result);
  _i9.exitCode = result;
}
