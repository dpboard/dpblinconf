# .bashrc




# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# User specific aliases and functions
alias rdjd="source /usr/local/pyvirtualenvs/radiodj_dev/bin/activate"
alias count="ls -1a | wc -l"
alias ll="ls -lh"
alias g="git"
alias v="vim"
alias pe="pipenv"
alias prp="pipenv run python"
alias sc="systemctl"

function screen_window() {
	if [ -n "${WINDOW}" ]; then
		echo "{screen: ${WINDOW}} "
	else
		echo ""
	fi
}


# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "[${BRANCH}${STAT}] "
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

function on_air_status() {
	if [ -n "${ON_AIR_STATUS}" ]; then
		echo "${ON_AIR_STATUS} "
	else
		echo ""
	fi
}

function docker_machine_prompt() {
	if [ -n "${__docker_machine_ps1}" ]; then
		echo "${__docker_machine_ps1} "
	else
		echo ""
	fi
}

export PS1="\`docker_machine_prompt\`\`on_air_status\`\[\e[92m\]\`screen_window\`\[\e[31m\]\`parse_git_branch\`\[\e[95m\]\t \u@\h \[\e[93m\]\w\n\[\e[36m\]> "
trap '[[ -t 1 ]] && tput sgr0' DEBUG

