echo ""
echo ""
echo "▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔"
echo " Building Schemas"
echo ""
echo "▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔"
echo ""
echo ""

#
# Get Schema Registry URL
curl -X GET "http://localhost:7788/api/v1/admin/schemas/registryInfo" -H "accept: application/json"

echo ""
echo ""

# Load Schemas into Schema Registry

for f in /opt/demo/FLaNK-AllTheStreams/schemas/*.avsc
do 

echo "Uploading Schema File $f"
schemaname="`echo $f | awk -F'[/.]' '{print $(NF-1)}'`"
echo "Schema [$schemaname]"
echo ""

curl -X POST "http://localhost:7788/api/v1/schemaregistry/schemas" -H "accept: application/json" -H "Content-Type: application/json" -d "{ \"type\": \"avro\", \"schemaGroup\": \"Kafka\", \"name\": \"$schemaname\", \"description\": \"schemaname\", \"compatibility\": \"BOTH\", \"validationLevel\": \"LATEST\"}"

echo ""

# Upload body

curl -X POST "http://localhost:7788/api/v1/schemaregistry/schemas/$schemaname/versions/upload?branch=MASTER&disableCanonicalCheck=false" -H "accept: application/json" -H "Content-Type: multipart/form-data" -F "file=@/opt/demo/FLaNK-AllTheStreams/schemas/$schemaname.avsc;type=application/json" -F "description=schemaname"

echo "Added."
echo ""

done
