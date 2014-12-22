#!/usr/bin/env python

import fnmatch
import subprocess
import shutil
import os

DOTFILES_DIR = os.path.join(os.environ['HOME'], '.dotfiles')
SCRIPTS_DIR = os.path.join(DOTFILES_DIR, 'scripts')
HOME_DIR = os.path.join(DOTFILES_DIR, 'home')
GIT_IGNORE_FILE = os.path.join(os.environ['HOME'], '.gitconfig')
PREZTO_DIR = os.path.join(DOTFILES_DIR, 'prezto')
PREZTORC_FILE = os.path.join(DOTFILES_DIR, 'shell', 'zpreztorc')
PREZTO_RUNCOMS_DIR = os.path.join(PREZTO_DIR, 'runcoms')

print('Initializing dotfiles...')
for filename in fnmatch.filter(os.listdir(SCRIPTS_DIR), '*.sh'):
    subprocess.call([os.path.join(SCRIPTS_DIR, filename)])

print('Moving files inplace...')
shutil.move(GIT_IGNORE_FILE, HOME_DIR)

print('Linking to dotfiles...')
for filename in fnmatch.filter(os.listdir(HOME_DIR), '.*'):
    home_file = os.path.join(os.environ['HOME'], filename)
    if os.path.exists(home_file):
        os.rename(home_file, home_file + '.backup')
    os.symlink(os.path.join(HOME_DIR, filename), home_file)
for filename in os.listdir(PREZTO_RUNCOMS_DIR):
    if not filename.endswith('.md'):
        home_file = os.path.join(os.environ['HOME'], '.' + filename)
        os.symlink(os.path.join(PREZTO_RUNCOMS_DIR, filename), home_file)
os.symlink(PREZTO_DIR, os.path.join(os.environ['HOME'], '.zprezto'))
os.unlink(os.path.join(os.environ['HOME'], '.zpreztorc'))
os.symlink(PREZTORC_FILE, os.path.join(os.environ['HOME'], '.zpreztorc'))