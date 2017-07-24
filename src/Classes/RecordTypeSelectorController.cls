/**
*	Description		:	This class is used to the page layout selector lightning component
*	Created Date	:	2/20/2017
*	Created By		:	A.T.
**/
public class RecordTypeSelectorController {
    
    @AuraEnabled
    public static List<RecordType> getListOfRecordType(){
        String query = 'SELECT Id,Name FROM RecordType WHERE IsActive=TRUE AND SobjectType =\''+'Account'+'\' ';
        try{
            List<RecordType> rtNames = new List<RecordType>();  
            Schema.SObjectType  objType = Account.SObjectType;        
            
            for(RecordTypeInfo rt : objType.getDescribe().getRecordTypeInfos()){
                //system.debug('Name' + rt.getName() + ' Available' + rt.isAvailable()); 
                if (rt.isAvailable())
                    rtNames.add(new RecordType(Id = rt.getRecordTypeId(),Name = rt.getName()));
            }    
            return rtNames;    
        }catch(Exception e){
            system.debug('ERROR' + e.getMessage());
            return null; 
        }    
    }
    
    @AuraEnabled
    public static Id getAccountRecordType() {
       system.debug('====================================inside start of getAccountRecordType');
       Id ClientRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Client').getRecordTypeId();
        system.debug('ClientRecordTypeId '+ClientRecordTypeId );
        system.debug('====================================inside end of getAccountRecordType');
        return ClientRecordTypeId;
    } 
}