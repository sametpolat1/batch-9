Account acc = [SELECT Id, Name, OwnerId, CreatedBy.Name
              FROM Account
              WHERE Id = '0018d00000Dgz1yAAB'] ;
//Prepare the inputs
Map<String, Object> inputs = new Map<String, Object>();
inputs.put('AccountId', acc.Id); 
inputs.put('AccountName', acc.Name); 
inputs.put('AccountOwnerId', acc.OwnerId); 
inputs.put('CreatedByName', acc.CreatedBy.Name); 

//Invoke the Flow

Flow.Interview flow11 = new FLow.Interview.X15_Account_AutoLaunch_Flow(inputs);
flow11.start();