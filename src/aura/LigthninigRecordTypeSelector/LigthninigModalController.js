({ 
    createRecord : function (component, event, helper) {
        var rtDet = document.querySelector('input[name="recordTypeRadio"]:checked');
    
        if(rtDet != null) {
            document.getElementById("newClientSectionId").style.display = "none" ;
            var createRecordEvent = $A.get("e.force:createRecord");
            createRecordEvent.setParams({
                "entityApiName": "Account",
                "recordTypeId":rtDet.id
            });
            createRecordEvent.fire();
        }    
    },
    
    showModal : function(component, event, helper) {
        document.getElementById("newClientSectionId").style.display = "block";
    },
    
    hideModal : function(component,event, helper){
        document.getElementById("newClientSectionId").style.display = "none" ;
    },
    
    doInit : function(component, event, helper) {   
        helper.RecordTypeSelectorController(component);   
    } 
 })