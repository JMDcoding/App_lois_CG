import os

replacements = {
    'Ã©': 'é',
    'Ã¨': 'è',
    'Ãª': 'ê',
    'Ã ': 'à', # a grave
    'Ã ': 'à', # sometimes a grave
    'Ã§': 'ç',
    'Ã®': 'î',
    'Ã´': 'ô',
    'Ã»': 'û',
    'Ã¢': 'â',
    'Ã¯': 'ï',
    'ÃƒÂ©': 'é', # double corruption
    'ÃƒÂ¨': 'è',
    'ÃƒÂ': 'à',
    'Ãƒ': 'à',
    'l\\'applique': 'l\\'application',
    'applique': 'application'
}

def fix_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
        
    new_content = content
    for bad, good in replacements.items():
        new_content = new_content.replace(bad, good)
        
    if new_content != content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Fixed {filepath}")

for root, dirs, files in os.walk('lib'):
    for file in files:
        if file.endswith('.dart'):
            fix_file(os.path.join(root, file))
