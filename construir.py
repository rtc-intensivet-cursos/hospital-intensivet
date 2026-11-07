"""Monta o index.html do site a partir de fonte/template.html + fonte/data.json."""
import os
os.chdir(os.path.dirname(os.path.abspath(__file__)))
t = open('fonte/template.html', encoding='utf-8').read()
d = open('fonte/data.json', encoding='utf-8').read()
h = t.replace('/*DATA*/', d)
if 'name="robots"' not in h:  # não aparecer no Google
    h = h.replace('<head>', '<head>\n<meta name="robots" content="noindex, nofollow">', 1)
open('index.html', 'w', encoding='utf-8', newline='\n').write(h)
print('index.html pronto', len(h), 'bytes')
