({
	RecordTypeSelectorController: function(component) {
    var action = component.get("c.getListOfRecordType");
    action.setCallback(this, function(actionResult) {
        var infos = actionResult.getReturnValue();
        component.set("v.recordTypes", infos);  
    });
    $A.enqueueAction(action);
  }
})