import re

rhymes = '''A sailor went to sea, sea, sea'''
print(f'rhymes = {rhymes}')
print(f'calling len(re.findall("sea", rhymes)), and obtaining : {len(re.findall("sea", rhymes))}')

rhymes = '''A sailor went to sea1, sea2, sea3'''
print(f'rhymes = {rhymes}')
print(f'calling len(re.findall("sea[1-9]", rhymes)), and obtaining : {len(re.findall("sea[1-9]", rhymes))}')
