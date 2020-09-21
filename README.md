# bashrc-contents

Contains aliases and scripts for the different environments home, work, and possibly other specialized environments like sysman. The files and directories contained in this repo are in turn refered to in the bashrc script, which is included in the "linux-settings" repo. Hence, there are two repositories acting in setting up the linux environment for different scenarios, linux-settings and bashrc-contents (this repo)

linux-settings: contains the bashrc file itself

bashrc-contents: contains the files that are sourced by bashrc

The idea with this setup is to be able to add commands to either both *home* and *work*, or only *home* environment, regardless of where I'm actual sitting right now, either home or at work. 

## Instructions

Add symlinks to your ~/bin directory

ln -s $HOME/sources/bashrc-contents/bin_home $HOME/bin/bin_home

ln -s $HOME/sources/bashrc-contents/bin_work $HOME/bin/bin_work

ln -s $HOME/sources/bashrc-contents/bin_sysman $HOME/bin/bin_sysman
