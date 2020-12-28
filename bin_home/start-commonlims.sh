echo "(start-commonlims.sh) cd to /home/edvard/sources/commonlims"
cd /home/edvard/sources/commonlims
#CONDA_BASE=$(conda info --base)
CONDA_BASE=/home/edvard/Installations/miniconda3
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate clims2
echo "(start-commonlims.sh) running make fresh"
make fresh && pytest tests/clims
