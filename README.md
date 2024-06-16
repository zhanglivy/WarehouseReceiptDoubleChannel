# Prepare
- Install Fabric test-network
- Download WarehouseReceiptDoubleChannel. Place it in upper level directory of fabric-samples.
# Operation
- Access to menu: WarehouseReceiptDoubleChannel/fabric-samples/warehouse-receipt, input ```source start.sh``` in ternimal 

# 停止并清理
- 进入WarehouseReceiptDoubleChannel/fabric-samples/warehouse-receipt目录，在终端中输入```./network-clean.sh```
- 执行完成后，在终端中输入```docker ps -a ```, 查看docker是否全部停止。 如果已经全部停止，进行下一部操作。
- 在终端中输入```docker volume prune```， 在终端提示时，输入```y```。
  
