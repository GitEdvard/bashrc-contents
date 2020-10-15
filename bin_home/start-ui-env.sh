google-chrome > /dev/null 2>&1 & 
drawio > /dev/null 2>&1 &
slack > /dev/null 2>&1 & 
cd $HOME/sources/commonlims
echo "(start-all.sh) cd to ${HOME}/sources/commonlims"
code . > /dev/null 2>&1 &
CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh
conda activate clims2
echo "(start-all.sh) running make fresh"
make fresh && pytest tests/clims
echo "(start-all.sh) run lims devserver --browser-reload"
lims devserver --browser-reload
