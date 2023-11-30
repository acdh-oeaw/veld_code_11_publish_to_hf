#!/bin/bash

echo "#################### building whl with spaCy's package"
python -m spacy package --force ./model/ ./out --build wheel

echo "#################### finding path of produced whl file"
out_folder=$(ls ./out)
whl_name=$(ls ./out/"$out_folder"/dist)
whl_full_path=./out/$out_folder/dist/$whl_name
echo "#################### path of whl file at: ${whl_full_path}"

echo "#################### passing HF token"
python -c "import os; from huggingface_hub.hf_api import HfFolder; HfFolder.save_token(os.environ.get('hf_token'))"

echo "#################### pushing to HF"
python -m spacy huggingface-hub push "$whl_full_path"

