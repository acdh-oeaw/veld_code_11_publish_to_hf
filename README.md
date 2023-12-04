
### upload spaCy models to HuggingFace with one command and avoid redundant model data

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

build:
```
docker compose -f veld.yaml build
```

run with parameters:
- `<TOKEN>` with your write-token from HF
- `<model_name>` with the name you want to give to your model (note that double underscore might not
  work due to some bug apparently)
- `<version>` duh
```
docker compose -f veld.yaml run -e hf_token=<TOKEN> -e version=<model_name> -e model_name=<version> veld
```

### caveats

Only tested with spaCy 3.6 and some German base models. But other versions should be usable too by
branching off this repo and modifying the Dockerfile and the spaCy dependencies therein according to
your needs.
