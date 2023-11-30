
To streamline the clunky HF upload, this docker service encapsulate the dependencies and persists
reproducible logic (from which pieces might be taken for manual workflows as well).

### prerequesistes

- have a write-token on HF 
- Have docker and docker compose installed
- a spaCy model in a local folder `./model`.
- define the name (and other various metadata to your liking) in spaCy's meta.json file. This will 
  be used by HF as source of truth.

### how to run

Replace `<TOKEN>` with your write-token from HF:
```
docker compose -f veld.yaml build
docker compose -f veld.yaml run -e hf_token=<TOKEN> veld
```

