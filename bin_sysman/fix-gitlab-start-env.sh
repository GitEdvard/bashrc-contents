#! /bin/bash
# Fakes a gitlab ci run for the commonlims-snpseq repository
# To be executed after buildservers.yml playbook has been run

rsync -av -e ssh --exclude .git /home/edvard/sources/commonlims-snpseq root@buildservers.snpseq.local:/data/gitlab-runner/home/
ssh root@buildservers.snpseq.local chown -R gitlab-runner: /data/gitlab-runner/home
scp /home/edvard/test_install_clims/Makefile root@buildservers.snpseq.local:/data/gitlab-runner/home/commonlims-snpseq/.
scp /home/edvard/test_install_clims/create-conda.sh root@buildservers.snpseq.local:/data/gitlab-runner/home/commonlims-snpseq/.
ssh root@buildservers.snpseq.local chmod -R u+w /data/gitlab-runner/home/commonlims-snpseq/
scp /home/edvard/test_install_clims/cd-gitlab.sh root@buildservers.snpseq.local:/root/.
ssh root@buildservers.snpseq.local chmod a+x /root/cd-gitlab.sh
scp /home/edvard/test_install_clims/su-gitlab.sh root@buildservers.snpseq.local:/data/gitlab-runner/home/.
ssh root@buildservers.snpseq.local chmod a+x /data/gitlab-runner/home/su-gitlab.sh

# Now, log in to server, change to gitlab-runner user and run build-conda-and-unit-test.sh
