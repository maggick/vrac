# create the folder
mkdir corpora_db
cd corpora_db

# Corpus of go-fuzz
git clone --depth 1 https://github.com/dvyukov/go-fuzz-corpus

# Another fuzzing corpus
git clone --depth 1 https://github.com/strongcourage/fuzzing-corpus

# Mozilla fuzzing corpus
git clone --depth 1 https://github.com/MozillaSecurity/fuzzdata

# Smallest possible syntactically valid files of different types
git clone --depth 1 https://github.com/mathiasbynens/small

# Fuzzing seeds
git clone --depth 1 https://github.com/moon2263/seeds

# exif seeds
git clone --depth 1 https://github.com/ianare/exif-samples

git clone --depth 1 https://github.com/fuzzdb-project/fuzzdb

# Then you can just search inside to find starting corpora
