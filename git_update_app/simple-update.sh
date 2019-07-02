#!/bin/bash
#
# Shazza-Works
# This is a simple set of aliases to push and pull your gits.
# uses these two commands from the working dir of your git.
#
# <nb>need to add to main program!
clear
echo -e "\n\n\tMake Sure This Is Correct!!!\n"
read -p "Whats is your git-hub username> " username
echo
echo -e "alias gitdown='git --git-dir=\$PWD/.git --work-tree=\$PWD/ status ; sleep 3 ; git --git-dir=\$PWD/.git --work-tree=\$PWD/ fetch ; git --git-dir=\$PWD/.git --work-tree=\$PWD/ stash ; wait ; git --git-dir=\$PWD/.git --work-tree=\$PWD/ merge .'" >> ~/.bash_profile
echo -e "alias gitup='git --git-dir=\$PWD/.git --work-tree=\$PWD/ status ; sleep 3 ; git --git-dir=\$PWD/.git --work-tree=\$PWD/ add . ; git --git-dir=\$PWD/.git --work-tree=\$PWD/ commit -m 'Updated_On_\$(date)' ; wait ; git --git-dir=\$PWD/.git --work-tree=\$PWD/ push https://github.com/$username/\$(basename \$PWD).git master'" >> ~/.bash_profile
echo

echo -e "\n\n\tNow you have run this there is 2x alias's that have been added to your .bash_profile and after you"
echo -e "\trestart your term you will now be able to use both with the cmds 'gitup' and 'gitdown'"
echo -e "\n\tUse,, gitup to push your local to remote repo and update that with your work."
echo
echo -e "\tUse,, gitdown to pull all changes to your local from remote, handy if you are on a few computers."
echo -e "\n\tJust use the two commands in each repo dir with your repository files in..."
echo -e "\n\n\t\tEnjoy...\n"
