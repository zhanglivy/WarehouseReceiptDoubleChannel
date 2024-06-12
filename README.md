# 准备工作
- 安装Fabric的测试网络
- 下载本项目，将本项目放到fabric-samples的上一级目录下
# 使用
- 进入WarehouseReceiptDoubleChannel/fabric-samples/warehouse-receipt目录，在终端中输入```source start.sh```

# 停止并清理
- 进入WarehouseReceiptDoubleChannel/fabric-samples/warehouse-receipt目录，在终端中输入```./network-clean.sh```
- 执行完成后，在终端中输入```docker ps -a ```, 查看docker是否全部停止。 如果已经全部停止，进行下一部操作。
- 在终端中输入```docker volume prune```， 在终端提示时，输入```y```。
  
