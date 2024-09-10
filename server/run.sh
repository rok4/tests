endpoint=$1

if [[ -z $endpoint ]]; then
    endpoint="http://localhost/"
fi

bru run -r --bail --env-var "endpoint=$endpoint" admin/on-off/
bru run -r --bail --env-var "endpoint=$endpoint" admin/create-layers/
bru run -r --bail --env-var "endpoint=$endpoint" admin/update-layers/
bru run -r --bail --env-var "endpoint=$endpoint" healthcheck/
bru run -r --bail --env-var "endpoint=$endpoint" common/
bru run -r --bail --env-var "endpoint=$endpoint" wmts/
bru run -r --bail --env-var "endpoint=$endpoint" wms/
bru run -r --bail --env-var "endpoint=$endpoint" tms/
bru run -r --bail --env-var "endpoint=$endpoint" tiles/
bru run -r --bail --env-var "endpoint=$endpoint" admin/delete-layers/