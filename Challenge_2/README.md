#### Challenge 2 is use the code that will query the meta data of an instance within Azure and provide a json formatted output.

##### In Azure, we can query the metadata of the azure instance using Azure Instance Metadata Service (IMDS) provides information about currently running virtual machine instances.

##### IMDS service endpoint categories
  - /metadata/instance => VM metadata
  - /metadata/identity => A managed identity via IMDS

#### By deafult, IMDS never leaves the host, thsi will work within the azure vm
