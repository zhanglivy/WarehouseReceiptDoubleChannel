#!/bin/bash
#
# SPDX-License-Identifier: Apache-2.0

echo "----------------------------------------------------start docker and create mychannl --------------------------------------------------------------------"
./network-starter.sh


echo "----------------------------------------------------create mychannl1 --------------------------------------------------------------------"
cd "../test-network/" 
. network1.sh createChannel -ca -s couchdb

echo "----------------------------------------------------mychannl 安装和批准智能合约--------------------------------------------------------------------"
echo "org1 installing"
cd "../warehouse-receipt/organization/a/" 
source aa.sh

peer lifecycle chaincode install cp.tar.gz 

if [ "$?" -ge 1 ]; then 
  peer lifecycle chaincode install cp.tar.gz
fi
export PACKAGE_ID=cp_0:a36121aa94321f8192c4db4d428148555dbda3e2e949dcd232522d93fc38c827

peer lifecycle chaincode approveformyorg --orderer localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID mychannel --name papercontract -v 0 --package-id $PACKAGE_ID --sequence 1 --tls --cafile $ORDERER_CA
if [ "$?" -eq 0 ]; then 
  echo "Org1 install success"
else
  echo "org1 installed failed"
fi

echo "org2 installing"
cd "../b/" 
source bb.sh 
peer lifecycle chaincode install cp.tar.gz 
if [ "$?" -ge 1 ]; then 
  peer lifecycle chaincode install cp.tar.gz
fi
export PACKAGE_ID=cp_0:a36121aa94321f8192c4db4d428148555dbda3e2e949dcd232522d93fc38c827

peer lifecycle chaincode approveformyorg --orderer localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID mychannel --name papercontract -v 0 --package-id $PACKAGE_ID --sequence 1 --tls --cafile $ORDERER_CA
if [ "$?" -eq 0 ]; then 
  echo "Org2 install success"
else
  echo "org2 installed failed"
fi

echo "org3 installing"
cd "../c/" 
source cc.sh 
peer lifecycle chaincode install cp.tar.gz 
if [ "$?" -ge 1 ]; then 
  peer lifecycle chaincode install cp.tar.gz
fi
export PACKAGE_ID=cp_0:a36121aa94321f8192c4db4d428148555dbda3e2e949dcd232522d93fc38c827 

peer lifecycle chaincode approveformyorg --orderer localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID mychannel --name papercontract -v 0 --package-id $PACKAGE_ID --sequence 1 --tls --cafile $ORDERER_CA
if [ "$?" -eq 0 ]; then 
  echo "Org3 install success"
else
  echo "org3 installed failed"
fi

peer lifecycle chaincode commit -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --peerAddresses localhost:7051 --tlsRootCertFiles ${PEER0_ORG1_CA} --peerAddresses localhost:8051 --tlsRootCertFiles ${PEER0_ORG2_CA} --peerAddresses localhost:9051 --tlsRootCertFiles ${PEER0_ORG3_CA} --channelID mychannel --name papercontract -v 0 --sequence 1 --tls --cafile $ORDERER_CA --waitForEvent


echo "----------------------------------------------------mychannl1 安装和批准智能合约--------------------------------------------------------------------"
echo "org2 installing"
echo "org2 installing"
cd "../b/" 
source bb1.sh 
peer lifecycle chaincode install cp1.tar.gz 
if [ "$?" -ge 1 ]; then 
  peer lifecycle chaincode install cp1.tar.gz
fi
export PACKAGE_ID=cp_0:a36121aa94321f8192c4db4d428148555dbda3e2e949dcd232522d93fc38c827

peer lifecycle chaincode approveformyorg --orderer localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID mychannel1 --name papercontract -v 0 --package-id $PACKAGE_ID --sequence 1 --tls --cafile $ORDERER_CA
if [ "$?" -eq 0 ]; then 
  echo "Org2 install success"
else
  echo "org2 installed failed"
fi

echo "org3 installing"
cd "../c/" 
source cc1.sh 
peer lifecycle chaincode install cp1.tar.gz 
if [ "$?" -ge 1 ]; then 
  peer lifecycle chaincode install cp1.tar.gz
fi
export PACKAGE_ID=cp_0:a36121aa94321f8192c4db4d428148555dbda3e2e949dcd232522d93fc38c827 

peer lifecycle chaincode approveformyorg --orderer localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID mychannel1 --name papercontract -v 0 --package-id $PACKAGE_ID --sequence 1 --tls --cafile $ORDERER_CA
if [ "$?" -eq 0 ]; then 
  echo "Org3 install success"
else
  echo "org3 installed failed"
fi

echo "org4 installing"
cd "../d/" 
source dd.sh 
peer lifecycle chaincode install cp1.tar.gz 
if [ "$?" -ge 1 ]; then 
  peer lifecycle chaincode install cp1.tar.gz
fi
export PACKAGE_ID=cp_0:a36121aa94321f8192c4db4d428148555dbda3e2e949dcd232522d93fc38c827

peer lifecycle chaincode approveformyorg --orderer localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID mychannel1 --name papercontract -v 0 --package-id $PACKAGE_ID --sequence 1 --tls --cafile $ORDERER_CA
if [ "$?" -eq 0 ]; then 
  echo "Org4 install success"
else
  echo "org4 installed failed"
fi
peer lifecycle chaincode commit -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --peerAddresses localhost:8051 --tlsRootCertFiles ${PEER0_ORG2_CA} --peerAddresses localhost:9051 --tlsRootCertFiles ${PEER0_ORG3_CA} --peerAddresses localhost:3051 --tlsRootCertFiles ${PEER0_ORG4_CA} --channelID mychannel1 --name papercontract -v 0 --sequence 1 --tls --cafile $ORDERER_CA --waitForEvent



echo "----------------------------------------------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------mychannel应用结构--------------------------------------------------------------------"
cd "../a/application/" 
npm install
node addToWallet.js
node enrollUser.js


cd "../../b/application/" 
npm install
node addToWallet.js
node enrollUser.js

cd "../../c/application/" 
npm install
node addToWallet.js
node enrollUser.js

cd "../../d/application/" 
npm install
node addToWallet.js
node enrollUser.js

cd "../../a/application/" 
echo "----------------------------------------------------issue--------------------------------------------------------------------"
node issue.js

cd "../../b/application/" 
echo "----------------------------------------------------buy--------------------------------------------------------------------"
node buy.js
echo "----------------------------------------------------buy_request--------------------------------------------------------------------"
node buy_request.js
echo "----------------------------------------------------transfer--------------------------------------------------------------------"
node transfer.js


cd "../../c/application/" 
echo "----------------------------------------------------redeem--------------------------------------------------------------------"
node redeem.js


echo "----------------------------------------------------------------------------------------------------------------------------------------"
echo "----------------------------------------------------mychannel1应用结构--------------------------------------------------------------------"
cd "../../b/application/" 
echo "----------------------------------------------------issue--------------------------------------------------------------------"
node issue1.js

cd "../../d/application/" 
echo "----------------------------------------------------buy--------------------------------------------------------------------"
node buy1.js
echo "----------------------------------------------------buy_request--------------------------------------------------------------------"
node buy_request1.js
echo "----------------------------------------------------transfer--------------------------------------------------------------------"
node transfer1.js


cd "../../c/application/" 
echo "----------------------------------------------------redeem--------------------------------------------------------------------"
node redeem1.js

