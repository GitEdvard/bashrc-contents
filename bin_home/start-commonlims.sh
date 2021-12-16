echo "(start-commonlims.sh) cd to /home/edvard/sources/snpseq/commonlims"
cd /home/edvard/sources/snpseq/commonlims
#CONDA_BASE=$(conda info --base)
eval "$(/home/edvard/Installations/miniconda3/bin/conda shell.bash hook)" # fix for source activate within a subshell...
#CONDA_BASE=/home/edvard/Installations/miniconda3
#source $CONDA_BASE/etc/profile.d/conda.sh
source activate clims2
echo "(start-commonlims.sh) running make fresh"
make fresh && pytest tests/clims
