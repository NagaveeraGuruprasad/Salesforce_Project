({
	doinit : function(component, event, helper) { //  component, event, helper are parameter of doinit function
		
        var action = component.get('c.getmymap'); // Calling apex method
        action.setCallback(this,function(response){  // getting response back from apex method
                           var state=response.getState(); // getting the state
        if(state==='Success'){
            component.set('v.Mapuse',response.getReturnValue()); // setting the value in attribute
        }
    });
        $A.enqueueAction(action);
}
})