endpoint=$1

if [[ -z $endpoint ]]; then
    endpoint="http://localhost/"
fi

bru run -r --env-var "endpoint=$endpoint" admin/create-layers/
bru run -r --env-var "endpoint=$endpoint" admin/update-layers/