
### upload to HuggingFace with one command, avoid redundant data

To streamline the clunky HuggingFace upload, this docker service encapsulates the dependencies and 
makes the calls reproducible with one command only, while also avoiding tripling the local model 
data size (since spaCy's package creates a whl file *and* a whole duplicated model folder, besides 
the original).

### prerequisites

- have a write-token on HF 
- have docker and docker compose installed
- a spaCy model in a local folder `./model`.
- define the name (and other various metadata to your liking) in spaCy's meta.json file.(e.g.
  `./model/meta.json`) This will be used by HF as source of truth.

### how to run

Replace `<TOKEN>` with your write-token from HF:
```
docker compose -f veld.yaml build # only needed once
docker compose -f veld.yaml run -e hf_token=<TOKEN> veld
```

