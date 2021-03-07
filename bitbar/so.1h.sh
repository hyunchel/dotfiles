#! /usr/local/bin/bash
echo $(env | grep -i bash)
PATH="/usr/local/bin/:$PATH"
URL="https://api.stackexchange.com/2.2/users/2407615/favorites?order=desc&sort=activity&site=stackoverflow"

echo "so"
echo "---"

mapfile -t links < <(curl -s -m 1 $URL | gzip -d | jq '.items | .[] | .title, .link')

idx=0
while [[ $idx -lt ${#links[@]} ]]; do
    title=${links[$idx]}
    link=${links[$idx+1]}
    echo "$title | href=$link"
    let idx=idx+2
done
