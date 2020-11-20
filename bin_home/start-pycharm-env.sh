google-chrome > /dev/null 2>&1 &
drawio > /dev/null 2>&1 &
slack > /dev/null 2>&1 & 
/opt/pycharm-2020.2.3/bin/pycharm.sh > /dev/null 2>&1 &
cd /home/edvard/sources/commonlims
echo "(start-all.sh) cd to /home/edvard/sources/commonlims"
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate clims2
echo "(start-all.sh) running make fresh"
make fresh && pytest tests/clims
