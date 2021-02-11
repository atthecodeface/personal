DOT_FILES         = .bashrc .emacs .bash_profile
DOT_FILES_IN_DATA = $(patsubst .%,_%,$(DOT_FILES))
OTHER_FILES       = emacs-lisp

DATA_FILES := $(patsubst %,data/%,$(OTHER_FILES) $(DOT_FILES_IN_DATA))
HOME_FILES := $(patsubst %,~/%,$(OTHER_FILES) $(DOT_FILES))

DIFF = diff -u --color=always

all: help

help:
	@echo "Use make copy_to_home to copy to the home directory"
	@echo "Use make copy_to_git  to copy out of the home directory into this git repo"
	@echo ""
	@echo "In the repo the files are ${DATA_FILES}"
	@echo "In the home directory the files are ${HOME_FILES}"

copy_to_home:
	rsync --archive --backup ${DATA_FILES} ~

copy_to_git:
	rsync --archive --backup ${HOME_FILES} data

diff_bashrc:
	($(DIFF) ~/.bashrc data/_bashrc ) || true

diff_bash_profile:
	($(DIFF) ~/.bash_profile data/_bash_profile ) || true

diff_emacs:
	($(DIFF) ~/.emacs data/_emacs ) || true

diff: diff_bashrc diff_bash_profile diff_emacs


