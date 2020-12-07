cd /home/edvard/sources/commonlims
echo "(start-all.sh) cd to /home/edvard/sources/commonlims"
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate clims2
echo "(start-all.sh) running make fresh"
make fresh && pytest tests/clims
