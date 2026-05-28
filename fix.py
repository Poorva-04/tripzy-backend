import re
content = open('tripzzyy_backup.sql', 'rb').read().decode('cp850')
content = re.sub(r'cp850', 'utf8mb4', content)
open('tripzzyy_backup_v2.sql', 'wb').write(content.encode('utf8'))
print('Done!')