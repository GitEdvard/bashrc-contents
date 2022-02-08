
#! /bin/bash
# Play an ansible playbook and apply it on Miarka
# Requires to be called from Miarka deployment node

if [[ $# -eq 0 ]]; then
	echo "Usage: play.sh <role, not playbook> [options]"
	exit 1
fi

#singularity run --bind /home/edvard/test-deploy /vulpes/ngi/miarka-ansible.sif ansible-playbook -i /home/edvard/sources/miarka-provision/inventory.yml install.yml --e site=upps --e deployment_remote_path=/home/edvard/test-deploy --e deployment_environment=devel --e deployment_version=123 --e anaconda_path=/home/edvard/miniconda3 --e root_path=/home/edvard/test-deploy --e ngi_pipeline_venv=/home/edvard/miniconda3/envs/NGI --e ngi_pipeline_venv3=/home/edvard/miniconda3/envs/NGI_py3 -t "$@"

ansible-playbook -i /home/edvard/miarka_mnt/miarka-provision/inventory.yml install.yml --e site=upps --e deployment_remote_path=/home/edvard/test-deploy --e deployment_environment=devel --e anaconda_path=/home/edvard/miniconda3 --e root_path=/home/edvard/test-deploy --e ngi_pipeline_venv=/home/edvard/miniconda3/envs/NGI --e ngi_pipeline_venv3=/home/edvard/miniconda3/envs/NGI_py3 --skip-tags ngi_pipeline,nextflow -t "$@"

