DOT_FILES         = .bashrc .emacs .bash_profile .zshenv
DOT_FILES_IN_DATA = $(patsubst .%,_%,$(DOT_FILES))
OTHER_FILES       = emacs-lisp

DATA_FILES := $(patsubst %,data/%,$(OTHER_FILES) $(DOT_FILES_IN_DATA))
HOME_FILES := $(patsubst %,~/%,$(OTHER_FILES) $(DOT_FILES))

UNAME = $(shell "uname")
ifeq ($(UNAME),Darwin)
DIFF := diff -u
else
DIFF := diff -u --color=always
endif

all: help

help:
	@echo "Use make copy_to_home to copy to the home directory"
	@echo "Use make copy_to_git  to copy out of the home directory into this git repo"
	@echo ""
	@echo "In the repo the files are ${DATA_FILES}"
	@echo "In the home directory the files are ${HOME_FILES}"

copy_to_home_zshenv:
	rsync --archive --backup data/_zshenv ~/.zshenv

copy_to_home_bashrc:
	rsync --archive --backup data/_bashrc ~/.bashrc

copy_to_home_bash_profile:
	rsync --archive --backup data/_bash_profile ~/.bash_profile

copy_to_home_emacs:
	rsync --archive --backup data/_emacs ~/.emacs

copy_to_home: copy_to_home_bash_profile copy_to_home_bashrc copy_to_home_emacs copy_to_home_zshenv
	rsync --archive --backup data/emacs-lisp data/zsh ~

copy_to_git:
	rsync --archive --backup ${HOME_FILES} data

diff_zshenv:
	($(DIFF) ~/.zshenv data/_zshenv ) || true

diff_bashrc:
	($(DIFF) ~/.bashrc data/_bashrc ) || true

diff_bash_profile:
	($(DIFF) ~/.bash_profile data/_bash_profile ) || true

diff_emacs:
	($(DIFF) ~/.emacs data/_emacs ) || true
	($(DIFF) ~/emacs-lisp data/emacs-lisp ) || true

diff_zsh:
	($(DIFF) ~/zsh data/zsh ) || true

diff: diff_zshenv diff_zsh diff_bashrc diff_bash_profile diff_emacs


