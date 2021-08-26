LOCATION="/home/azureuser/CompendiumNG/application/src/"
echo "Cleaning out files in:"
echo $LOCATION
#cleans out \"
sed -i 's|\\\"|\" + '\''\"'\'' + \"|g' $(find $LOCATION -type f -name "*.java") && echo "Cleaned out \\\""
#cleans out '"+'"'+"'
sed -i 's|'\''\" + '\''\"'\'' + \"'\''|'\''\"'\''|g' $(find $LOCATION -type f -name "*.java") && echo "Cleaned out '\"+'\"'+\"'"
#cleans out "\" + '"' + "
sed -i 's|\"\\\" + '\''\"'\'' + \"|'\''\\\\'\''|g' $(find $LOCATION -type f -name "*.java") && echo "Cleaned out \"\\\" + '\"' + \""
sed -i 's|\"\\\\\\\" + '\''\"'\'' + \"|'\''\\\\'\'' + '\''\\\\'\''|g' $(find $LOCATION -type f -name "*.java") && echo "Cleaned out \"\\\\\\\" + '\''\"'\'' + \""
#cleans out issues caused by first command
sed -i 's|"\\\\\" + '\''\"'\'' + \"\"|'\''\\\\'\'' + '\''\"'\''|g' $(find $LOCATION -type f -name "*.java")
sed -i 's|\\\\\\\" + '\''\"'\'' + \"|\" + '\''\\\\'\'' + '\''\\\\'\'' + '\''\\\\'\'' + '\''\\\\'\''|g' $(find $LOCATION -type f -name "*.java") && echo "Cleaned out \\\\\\\" + '\''\"'\'' + \""
sed -i 's|\\\" + '\''\"'\'' + \"|\" + '\''\\\\'\''|g' $(find $LOCATION -type f -name "*.java") && echo "Cleaned out \\\" + '\''\"'\'' + \""
#cleans out /"
#for i in {1..3}; do ; done
sed -i 's|/\"|\" + '\''/'\''|g' $(find $LOCATION -type f -name "*.java")
sed -i 's|/\"|\" + '\''/'\''|g' $(find $LOCATION -type f -name "*.java")
sed -i 's|/\"|\" + '\''/'\''|g' $(find $LOCATION -type f -name "*.java")
echo "Cleaning complete"