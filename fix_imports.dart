import 'dart:io';

void main() {
  const oldPath = 'features/futures'; // ✏️ غيّر ده
  const newPath = 'features'; // ✏️ وده كمان

  final directory = Directory('lib'); // أو أي مجلد فيه الكود
  final dartFiles = directory
      .listSync(recursive: true)
      .where((entity) => entity.path.endsWith('.dart'));

  for (var file in dartFiles) {
    final filePath = file.path;
    final content = File(filePath).readAsStringSync();

    if (content.contains(oldPath)) {
      final newContent = content.replaceAll(oldPath, newPath);
      File(filePath).writeAsStringSync(newContent);
      print('✔️ Updated: $filePath');
    }
  }

  print('\n🎉 Finished fixing imports!');
}
