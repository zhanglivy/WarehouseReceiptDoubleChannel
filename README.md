# Prepare
- Install environments.
  | Hardware  | Software | 
  | :----: | :----: | 
  4-core CPU | Linux Operating System (Ubuntu v22.04.1LTS) | 
  4GB Memory | VMware v16.2.4 | 
  | 100GB Storage Space | Apache v2.0 | 
  | | Fabric v2.4.9 | 
  | |Docker v1.4.7|
  ||Docker compose v1.29.2|
  ||Go v1.18.1|
  ||Fabric CA v1.5.5|
  ||Git v2.34.1|
  ||Couchdb v3.1.1|
  ||Node.js v18.12.1|
  ||Fabric explorer v1.1.8|
  ||Caliper v0.5.0|
   
- Using the Fabric test network

  Please refer to the site to install and finish the operation of fabric-test network.  
  https://hyperledger-fabric.readthedocs.io/en/release-2.5/test_network.html.

  Then go to the next step.
  
- Download WarehouseReceiptDoubleChannel. Place it in upper level directory of fabric-samples.
  
# Operation
- Enter into directory: WarehouseReceiptDoubleChannel/fabric-samples/warehouse-receipt, input ```source start.sh``` in ternimal. 

# Bring down and clean
- Enter into directory: WarehouseReceiptDoubleChannel/fabric-samples/warehouse-receipt，input```./network-clean.sh``` in ternimal.
- Input ```docker ps -a ``` in ternimal, check all dockers have stopped, then enter into next step.
- Input ```docker volume prune``` in ternimal， when the terminal displays, input ```y```.
  
