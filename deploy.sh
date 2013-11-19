#!/bin/bash

dotfiles_dir=$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
bash $dotfiles_dir/dotfiles_installer/install.sh
