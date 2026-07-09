import 'dart:io';

final Map<String, String> replacements = {
  'Ã©': 'é',
  'Ã¨': 'è',
  'Ãª': 'ê',
  'Ã ': 'à',
  'Ã ': 'à',
  'Ã§': 'ç',
  'Ã®': 'î',
  'Ã´': 'ô',
  'Ã»': 'û',
  'Ã¢': 'â',
  'Ã¯': 'ï',
  'ÃƒÂ©': 'é',
  'ÃƒÂ¨': 'è',
  'ÃƒÂ': 'à',
  'Ãƒ': 'à',
  'Ã‰': 'É',
  'Ã€': 'À',
  'â€¢': '•',
  'ðŸ‡¨ðŸ‡¬': '🇨🇬',
  'ðŸš¨': '🚨',
  'ðŸ’¡': '💡',
  "l\\'applique": "l\\'application",
  "applique": "application"
};

void main() {
  final dir = Directory('lib');
  final entities = dir.listSync(recursive: true);

  for (final entity in entities) {
    if (entity is File && entity.path.endsWith('.dart')) {
      fixFile(entity);
    }
  }
}

void fixFile(File file) {
  try {
    final content = file.readAsStringSync();
    var newContent = content;
    
    replacements.forEach((bad, good) {
      newContent = newContent.replaceAll(bad, good);
    });
    
    if (newContent != content) {
      file.writeAsStringSync(newContent);
      print('Fixed ${file.path}');
    }
  } catch (e) {
    // skip non-utf8 files
  }
}
