#!/bin/bash

echo "#################### building whl with spaCy's package"
python -m spacy package --force /veld/input/model/ /tmp/out --build wheel --version $version --name $model_name

echo "#################### finding path of produced whl file"
out_folder=$(ls /tmp/out)
whl_name=$(ls /tmp/out/"$out_folder"/dist)
whl_full_path=/tmp/out/$out_folder/dist/$whl_name
echo "#################### path of whl file at: ${whl_full_path}"

echo "#################### passing HF token"
python -c "import os; from huggingface_hub.hf_api import HfFolder; HfFolder.save_token(os.environ.get('hf_token'))"

echo "#################### pushing to HF"
python -m spacy huggingface-hub push "$whl_full_path"

