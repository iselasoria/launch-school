[[multiple inheritance]]
When Ruby searches to try to resolve a method,  it will look at mixin [[modules]] right after having searched its own class boundaries. 

	Remember that to resolve a method, Ruby will always first look within its class definition.

Once it starts to look in mixin modules, Ruby will first search in the  _last_ module included in the class from where the method in question is getting called. 