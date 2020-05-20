\ LP format - for model browsing. Use MPS format to capture full model detail.
Maximize
  0 O[1,6,0] + 0 O[1,6,1] + 0 O[1,6,2] + 0 O[1,6,3] + 0 O[1,6,4]
   + 0 O[1,6,5] + 0 O[1,6,6] + 0 O[1,6,7] + 0 O[1,6,8] + 0 O[1,6,9]
   + 0 O[1,6,10] + 0 O[1,7,0] + 0 O[1,7,1] + 0 O[1,7,2] + 0 O[1,7,3]
   + 0 O[1,7,4] + 0 O[1,7,5] + 0 O[1,7,6] + 0 O[1,7,7] + 0 O[1,7,8]
   + 0 O[1,7,9] + 0 O[1,7,10] - 2 n[1,1] - 2 n[1,2] - 2 n[1,3] - 2 n[1,4]
   - 2 n[1,5] - 2 n[1,6] - 2 n[1,7] - 2 n[1,8] - 2 n[1,9] - 2 n[1,10]
   + 2 v[1,1,1] + 2 v[1,1,2] + 2 v[1,1,3] + 2 v[1,1,4] + 2 v[1,1,5]
   + 2 v[1,1,6] + 2 v[1,1,7] + 2 v[1,1,8] + 2 v[1,1,9] + 2 v[1,1,10]
   + 2 v[1,2,1] + 2 v[1,2,2] + 2 v[1,2,3] + 2 v[1,2,4] + 2 v[1,2,5]
   + 2 v[1,2,6] + 2 v[1,2,7] + 2 v[1,2,8] + 2 v[1,2,9] + 2 v[1,2,10]
   + 4 v[1,3,1] + 4 v[1,3,2] + 4 v[1,3,3] + 4 v[1,3,4] + 4 v[1,3,5]
   + 4 v[1,3,6] + 4 v[1,3,7] + 4 v[1,3,8] + 4 v[1,3,9] + 4 v[1,3,10]
   + 2 v[1,4,1] + 2 v[1,4,2] + 2 v[1,4,3] + 2 v[1,4,4] + 2 v[1,4,5]
   + 2 v[1,4,6] + 2 v[1,4,7] + 2 v[1,4,8] + 2 v[1,4,9] + 2 v[1,4,10]
   + 2 v[1,5,1] + 2 v[1,5,2] + 2 v[1,5,3] + 2 v[1,5,4] + 2 v[1,5,5]
   + 2 v[1,5,6] + 2 v[1,5,7] + 2 v[1,5,8] + 2 v[1,5,9] + 2 v[1,5,10]
   + 0 v[1,6,0] + 0 v[1,6,1] + 0 v[1,6,2] + 0 v[1,6,3] + 0 v[1,6,4]
   + 0 v[1,6,5] + 0 v[1,6,6] + 0 v[1,6,7] + 0 v[1,6,8] + 0 v[1,6,9]
   + 0 v[1,6,10] + 0 v[1,7,0] + 0 v[1,7,1] + 0 v[1,7,2] + 0 v[1,7,3]
   + 0 v[1,7,4] + 0 v[1,7,5] + 0 v[1,7,6] + 0 v[1,7,7] + 0 v[1,7,8]
   + 0 v[1,7,9] + 0 v[1,7,10] + 0 w[1,0] - 2 w[1,1] - 2 w[1,2] - 2 w[1,3]
   - 2 w[1,4] - 2 w[1,5] - 2 w[1,6] - 2 w[1,7] - 2 w[1,8] - 2 w[1,9]
   - 2 w[1,10] + 0 r[1,0] + 0 R[1,0] - Beta[1] - Beta[2] - Beta[3]
   - Beta[4] - Beta[5] - Beta[6] - Beta[7] - Beta[8] - Beta[9] - Beta[10]
   + 0 gamma[1,0] - 2 gamma[1,1] - 2 gamma[1,2] - 2 gamma[1,3]
   - 2 gamma[1,4] - 2 gamma[1,5] - 2 gamma[1,6] - 2 gamma[1,7]
   - 2 gamma[1,8] - 2 gamma[1,9] - 2 gamma[1,10] + 0 Lambda[0] - Lambda[1]
   - Lambda[2] - Lambda[3] - Lambda[4] - Lambda[5] - Lambda[6] - Lambda[7]
   - Lambda[8] - Lambda[9] - Lambda[10]
Subject To
 ageFlow[1][2,1]: - O[1,1,0] + O[1,2,1] + v[1,1,0] = 0
 ageFlow[1][2,2]: - O[1,1,1] + O[1,2,2] + v[1,1,1] = 0
 ageFlow[1][2,3]: - O[1,1,2] + O[1,2,3] + v[1,1,2] = 0
 ageFlow[1][2,4]: - O[1,1,3] + O[1,2,4] + v[1,1,3] = 0
 ageFlow[1][2,5]: - O[1,1,4] + O[1,2,5] + v[1,1,4] = 0
 ageFlow[1][2,6]: - O[1,1,5] + O[1,2,6] + v[1,1,5] = 0
 ageFlow[1][2,7]: - O[1,1,6] + O[1,2,7] + v[1,1,6] = 0
 ageFlow[1][2,8]: - O[1,1,7] + O[1,2,8] + v[1,1,7] = 0
 ageFlow[1][2,9]: - O[1,1,8] + O[1,2,9] + v[1,1,8] = 0
 ageFlow[1][2,10]: - O[1,1,9] + O[1,2,10] + v[1,1,9] = 0
 ageFlow[1][3,1]: - O[1,2,0] + O[1,3,1] + v[1,2,0] = 0
 ageFlow[1][3,2]: - O[1,2,1] + O[1,3,2] + v[1,2,1] = 0
 ageFlow[1][3,3]: - O[1,2,2] + O[1,3,3] + v[1,2,2] = 0
 ageFlow[1][3,4]: - O[1,2,3] + O[1,3,4] + v[1,2,3] = 0
 ageFlow[1][3,5]: - O[1,2,4] + O[1,3,5] + v[1,2,4] = 0
 ageFlow[1][3,6]: - O[1,2,5] + O[1,3,6] + v[1,2,5] = 0
 ageFlow[1][3,7]: - O[1,2,6] + O[1,3,7] + v[1,2,6] = 0
 ageFlow[1][3,8]: - O[1,2,7] + O[1,3,8] + v[1,2,7] = 0
 ageFlow[1][3,9]: - O[1,2,8] + O[1,3,9] + v[1,2,8] = 0
 ageFlow[1][3,10]: - O[1,2,9] + O[1,3,10] + v[1,2,9] = 0
 ageFlow[1][4,1]: - O[1,3,0] + O[1,4,1] + v[1,3,0] = 0
 ageFlow[1][4,2]: - O[1,3,1] + O[1,4,2] + v[1,3,1] = 0
 ageFlow[1][4,3]: - O[1,3,2] + O[1,4,3] + v[1,3,2] = 0
 ageFlow[1][4,4]: - O[1,3,3] + O[1,4,4] + v[1,3,3] = 0
 ageFlow[1][4,5]: - O[1,3,4] + O[1,4,5] + v[1,3,4] = 0
 ageFlow[1][4,6]: - O[1,3,5] + O[1,4,6] + v[1,3,5] = 0
 ageFlow[1][4,7]: - O[1,3,6] + O[1,4,7] + v[1,3,6] = 0
 ageFlow[1][4,8]: - O[1,3,7] + O[1,4,8] + v[1,3,7] = 0
 ageFlow[1][4,9]: - O[1,3,8] + O[1,4,9] + v[1,3,8] = 0
 ageFlow[1][4,10]: - O[1,3,9] + O[1,4,10] + v[1,3,9] = 0
 ageFlow[1][5,1]: - O[1,4,0] + O[1,5,1] + v[1,4,0] = 0
 ageFlow[1][5,2]: - O[1,4,1] + O[1,5,2] + v[1,4,1] = 0
 ageFlow[1][5,3]: - O[1,4,2] + O[1,5,3] + v[1,4,2] = 0
 ageFlow[1][5,4]: - O[1,4,3] + O[1,5,4] + v[1,4,3] = 0
 ageFlow[1][5,5]: - O[1,4,4] + O[1,5,5] + v[1,4,4] = 0
 ageFlow[1][5,6]: - O[1,4,5] + O[1,5,6] + v[1,4,5] = 0
 ageFlow[1][5,7]: - O[1,4,6] + O[1,5,7] + v[1,4,6] = 0
 ageFlow[1][5,8]: - O[1,4,7] + O[1,5,8] + v[1,4,7] = 0
 ageFlow[1][5,9]: - O[1,4,8] + O[1,5,9] + v[1,4,8] = 0
 ageFlow[1][5,10]: - O[1,4,9] + O[1,5,10] + v[1,4,9] = 0
 newFruitDemand[1,1]: v[1,1,1] + v[1,2,1] <= 2
 newFruitDemand[1,2]: v[1,1,2] + v[1,2,2] <= 2
 newFruitDemand[1,3]: v[1,1,3] + v[1,2,3] <= 2
 newFruitDemand[1,4]: v[1,1,4] + v[1,2,4] <= 2
 newFruitDemand[1,5]: v[1,1,5] + v[1,2,5] <= 2
 newFruitDemand[1,6]: v[1,1,6] + v[1,2,6] <= 2
 newFruitDemand[1,7]: v[1,1,7] + v[1,2,7] <= 2
 newFruitDemand[1,8]: v[1,1,8] + v[1,2,8] <= 2
 newFruitDemand[1,9]: v[1,1,9] + v[1,2,9] <= 2
 newFruitDemand[1,10]: v[1,1,10] + v[1,2,10] <= 2
 oldFruitDemand[1,1]: v[1,3,1] + v[1,4,1] + v[1,5,1] <= 2
 oldFruitDemand[1,2]: v[1,3,2] + v[1,4,2] + v[1,5,2] <= 2
 oldFruitDemand[1,3]: v[1,3,3] + v[1,4,3] + v[1,5,3] <= 2
 oldFruitDemand[1,4]: v[1,3,4] + v[1,4,4] + v[1,5,4] <= 2
 oldFruitDemand[1,5]: v[1,3,5] + v[1,4,5] + v[1,5,5] <= 2
 oldFruitDemand[1,6]: v[1,3,6] + v[1,4,6] + v[1,5,6] <= 2
 oldFruitDemand[1,7]: v[1,3,7] + v[1,4,7] + v[1,5,7] <= 2
 oldFruitDemand[1,8]: v[1,3,8] + v[1,4,8] + v[1,5,8] <= 2
 oldFruitDemand[1,9]: v[1,3,9] + v[1,4,9] + v[1,5,9] <= 2
 oldFruitDemand[1,10]: v[1,3,10] + v[1,4,10] + v[1,5,10] <= 2
 demandSatistfaction[1]: v[1,1,1] + v[1,2,1] + v[1,3,1] + v[1,4,1]
   + v[1,5,1] <= 5
 demandSatistfaction[2]: v[1,1,2] + v[1,2,2] + v[1,3,2] + v[1,4,2]
   + v[1,5,2] <= 5
 demandSatistfaction[3]: v[1,1,3] + v[1,2,3] + v[1,3,3] + v[1,4,3]
   + v[1,5,3] <= 5
 demandSatistfaction[4]: v[1,1,4] + v[1,2,4] + v[1,3,4] + v[1,4,4]
   + v[1,5,4] <= 5
 demandSatistfaction[5]: v[1,1,5] + v[1,2,5] + v[1,3,5] + v[1,4,5]
   + v[1,5,5] <= 5
 demandSatistfaction[6]: v[1,1,6] + v[1,2,6] + v[1,3,6] + v[1,4,6]
   + v[1,5,6] <= 5
 demandSatistfaction[7]: v[1,1,7] + v[1,2,7] + v[1,3,7] + v[1,4,7]
   + v[1,5,7] <= 5
 demandSatistfaction[8]: v[1,1,8] + v[1,2,8] + v[1,3,8] + v[1,4,8]
   + v[1,5,8] <= 5
 demandSatistfaction[9]: v[1,1,9] + v[1,2,9] + v[1,3,9] + v[1,4,9]
   + v[1,5,9] <= 5
 demandSatistfaction[10]: v[1,1,10] + v[1,2,10] + v[1,3,10] + v[1,4,10]
   + v[1,5,10] <= 5
 newShelves[1,1]: 2 O[1,1,1] + 2 O[1,2,1] - r[1,1] <= 0
 newShelves[1,2]: 2 O[1,1,2] + 2 O[1,2,2] - r[1,2] <= 0
 newShelves[1,3]: 2 O[1,1,3] + 2 O[1,2,3] - r[1,3] <= 0
 newShelves[1,4]: 2 O[1,1,4] + 2 O[1,2,4] - r[1,4] <= 0
 newShelves[1,5]: 2 O[1,1,5] + 2 O[1,2,5] - r[1,5] <= 0
 newShelves[1,6]: 2 O[1,1,6] + 2 O[1,2,6] - r[1,6] <= 0
 newShelves[1,7]: 2 O[1,1,7] + 2 O[1,2,7] - r[1,7] <= 0
 newShelves[1,8]: 2 O[1,1,8] + 2 O[1,2,8] - r[1,8] <= 0
 newShelves[1,9]: 2 O[1,1,9] + 2 O[1,2,9] - r[1,9] <= 0
 newShelves[1,10]: 2 O[1,1,10] + 2 O[1,2,10] - r[1,10] <= 0
 oldShelves[1,1]: 2 O[1,3,1] + 2 O[1,4,1] + 2 O[1,5,1] - R[1,1] <= 0
 oldShelves[1,2]: 2 O[1,3,2] + 2 O[1,4,2] + 2 O[1,5,2] - R[1,2] <= 0
 oldShelves[1,3]: 2 O[1,3,3] + 2 O[1,4,3] + 2 O[1,5,3] - R[1,3] <= 0
 oldShelves[1,4]: 2 O[1,3,4] + 2 O[1,4,4] + 2 O[1,5,4] - R[1,4] <= 0
 oldShelves[1,5]: 2 O[1,3,5] + 2 O[1,4,5] + 2 O[1,5,5] - R[1,5] <= 0
 oldShelves[1,6]: 2 O[1,3,6] + 2 O[1,4,6] + 2 O[1,5,6] - R[1,6] <= 0
 oldShelves[1,7]: 2 O[1,3,7] + 2 O[1,4,7] + 2 O[1,5,7] - R[1,7] <= 0
 oldShelves[1,8]: 2 O[1,3,8] + 2 O[1,4,8] + 2 O[1,5,8] - R[1,8] <= 0
 oldShelves[1,9]: 2 O[1,3,9] + 2 O[1,4,9] + 2 O[1,5,9] - R[1,9] <= 0
 oldShelves[1,10]: 2 O[1,3,10] + 2 O[1,4,10] + 2 O[1,5,10] - R[1,10] <= 0
 totalShelves[1]: r[1,1] + R[1,1] <= 1
 totalShelves[2]: r[1,2] + R[1,2] <= 1
 totalShelves[3]: r[1,3] + R[1,3] <= 1
 totalShelves[4]: r[1,4] + R[1,4] <= 1
 totalShelves[5]: r[1,5] + R[1,5] <= 1
 totalShelves[6]: r[1,6] + R[1,6] <= 1
 totalShelves[7]: r[1,7] + R[1,7] <= 1
 totalShelves[8]: r[1,8] + R[1,8] <= 1
 totalShelves[9]: r[1,9] + R[1,9] <= 1
 totalShelves[10]: r[1,10] + R[1,10] <= 1
 fruitExtraction[1,1]: - n[1,0] + n[1,1] + 1e+010 Lambda[1] >= 0
 fruitExtraction[1,2]: - n[1,1] + n[1,2] + 1e+010 Lambda[2] >= 0
 fruitExtraction[1,3]: - n[1,2] + n[1,3] + 1e+010 Lambda[3] >= 0
 fruitExtraction[1,4]: - n[1,3] + n[1,4] + 1e+010 Lambda[4] >= 0
 fruitExtraction[1,5]: - n[1,4] + n[1,5] + 1e+010 Lambda[5] >= 0
 fruitExtraction[1,6]: - n[1,5] + n[1,6] + 1e+010 Lambda[6] >= 0
 fruitExtraction[1,7]: - n[1,6] + n[1,7] + 1e+010 Lambda[7] >= 0
 fruitExtraction[1,8]: - n[1,7] + n[1,8] + 1e+010 Lambda[8] >= 0
 fruitExtraction[1,9]: - n[1,8] + n[1,9] + 1e+010 Lambda[9] >= 0
 fruitExtraction[1,10]: - n[1,9] + n[1,10] + 1e+010 Lambda[10] >= 0
 maxStorage[1]: 2 n[1,1] <= 1
 maxStorage[2]: 2 n[1,2] <= 1
 maxStorage[3]: 2 n[1,3] <= 1
 maxStorage[4]: 2 n[1,4] <= 1
 maxStorage[5]: 2 n[1,5] <= 1
 maxStorage[6]: 2 n[1,6] <= 1
 maxStorage[7]: 2 n[1,7] <= 1
 maxStorage[8]: 2 n[1,8] <= 1
 maxStorage[9]: 2 n[1,9] <= 1
 maxStorage[10]: 2 n[1,10] <= 1
 maxGarbage[1]: 2 b[1,1] <= 1
 maxGarbage[2]: 2 b[1,2] <= 1
 maxGarbage[3]: 2 b[1,3] <= 1
 maxGarbage[4]: 2 b[1,4] <= 1
 maxGarbage[5]: 2 b[1,5] <= 1
 maxGarbage[6]: 2 b[1,6] <= 1
 maxGarbage[7]: 2 b[1,7] <= 1
 maxGarbage[8]: 2 b[1,8] <= 1
 maxGarbage[9]: 2 b[1,9] <= 1
 maxGarbage[10]: 2 b[1,10] <= 1
 buyDecision[1,1]: w[1,1] - 1e+010 gamma[1,1] <= 0
 buyDecision[1,2]: w[1,2] - 1e+010 gamma[1,2] <= 0
 buyDecision[1,3]: w[1,3] - 1e+010 gamma[1,3] <= 0
 buyDecision[1,4]: w[1,4] - 1e+010 gamma[1,4] <= 0
 buyDecision[1,5]: w[1,5] - 1e+010 gamma[1,5] <= 0
 buyDecision[1,6]: w[1,6] - 1e+010 gamma[1,6] <= 0
 buyDecision[1,7]: w[1,7] - 1e+010 gamma[1,7] <= 0
 buyDecision[1,8]: w[1,8] - 1e+010 gamma[1,8] <= 0
 buyDecision[1,9]: w[1,9] - 1e+010 gamma[1,9] <= 0
 buyDecision[1,10]: w[1,10] - 1e+010 gamma[1,10] <= 0
 storageFlow[1,1]: O[1,1,1] + n[1,0] - n[1,1] - w[1,1] = 0
 storageFlow[1,2]: O[1,1,2] + n[1,1] - n[1,2] - w[1,2] = 0
 storageFlow[1,3]: O[1,1,3] + n[1,2] - n[1,3] - w[1,3] = 0
 storageFlow[1,4]: O[1,1,4] + n[1,3] - n[1,4] - w[1,4] = 0
 storageFlow[1,5]: O[1,1,5] + n[1,4] - n[1,5] - w[1,5] = 0
 storageFlow[1,6]: O[1,1,6] + n[1,5] - n[1,6] - w[1,6] = 0
 storageFlow[1,7]: O[1,1,7] + n[1,6] - n[1,7] - w[1,7] = 0
 storageFlow[1,8]: O[1,1,8] + n[1,7] - n[1,8] - w[1,8] = 0
 storageFlow[1,9]: O[1,1,9] + n[1,8] - n[1,9] - w[1,9] = 0
 storageFlow[1,10]: O[1,1,10] + n[1,9] - n[1,10] - w[1,10] = 0
 garbageFlow[1,1]: - O[1,5,0] - b[1,0] + b[1,1] + v[1,5,0] + [
   b[1,0] * Beta[0] ] = 0
 garbageFlow[1,2]: - O[1,5,1] - b[1,1] + b[1,2] + v[1,5,1] + [
   b[1,1] * Beta[1] ] = 0
 garbageFlow[1,3]: - O[1,5,2] - b[1,2] + b[1,3] + v[1,5,2] + [
   b[1,2] * Beta[2] ] = 0
 garbageFlow[1,4]: - O[1,5,3] - b[1,3] + b[1,4] + v[1,5,3] + [
   b[1,3] * Beta[3] ] = 0
 garbageFlow[1,5]: - O[1,5,4] - b[1,4] + b[1,5] + v[1,5,4] + [
   b[1,4] * Beta[4] ] = 0
 garbageFlow[1,6]: - O[1,5,5] - b[1,5] + b[1,6] + v[1,5,5] + [
   b[1,5] * Beta[5] ] = 0
 garbageFlow[1,7]: - O[1,5,6] - b[1,6] + b[1,7] + v[1,5,6] + [
   b[1,6] * Beta[6] ] = 0
 garbageFlow[1,8]: - O[1,5,7] - b[1,7] + b[1,8] + v[1,5,7] + [
   b[1,7] * Beta[7] ] = 0
 garbageFlow[1,9]: - O[1,5,8] - b[1,8] + b[1,9] + v[1,5,8] + [
   b[1,8] * Beta[8] ] = 0
 garbageFlow[1,10]: - O[1,5,9] - b[1,9] + b[1,10] + v[1,5,9] + [
   b[1,9] * Beta[9] ] = 0
Bounds
Binaries
 Beta[0] Beta[1] Beta[2] Beta[3] Beta[4] Beta[5] Beta[6] Beta[7] Beta[8]
 Beta[9] Beta[10] gamma[1,0] gamma[1,1] gamma[1,2] gamma[1,3] gamma[1,4]
 gamma[1,5] gamma[1,6] gamma[1,7] gamma[1,8] gamma[1,9] gamma[1,10]
 Lambda[0] Lambda[1] Lambda[2] Lambda[3] Lambda[4] Lambda[5] Lambda[6]
 Lambda[7] Lambda[8] Lambda[9] Lambda[10]
Generals
 r[1,0] r[1,1] r[1,2] r[1,3] r[1,4] r[1,5] r[1,6] r[1,7] r[1,8] r[1,9]
 r[1,10] R[1,0] R[1,1] R[1,2] R[1,3] R[1,4] R[1,5] R[1,6] R[1,7] R[1,8]
 R[1,9] R[1,10]
End
