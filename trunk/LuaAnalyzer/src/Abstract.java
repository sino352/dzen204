import java.util.HashMap;



public class Abstract extends Entity {
	
	public static enum Type {
		FUNCTION,
		VARIABLE,
		TABLE
	}
	
	private Type abstractType;
	private Abstract parent;
	private HashMap<String, Abstract> children=new HashMap<String, Abstract>();
	
	public Abstract(){
		super();
		//children = new HashMap<String, Abstract>();
	}
	
	
	public Abstract(String name){
		super(name);
		
	}
		
	public void addChield(String chName, Abstract chield){
		chield.setParent(this);
		children.put(chName, chield);
	}
	
	public Abstract getFromLocalAndParent(String chName){
		if (children.containsKey(chName))
			return children.get(chName);
		else if (null != parent)
			return parent.getFromLocalAndParent(chName);
		return null;
	}
	
	public Abstract getFromLocalAndChield(String chName){
		if (children.containsKey(chName))
			return children.get(chName);
		else {
			for(Abstract chield:children.values()){
				Abstract result = chield.getFromLocalAndChield(chName);
				if (null != result)
					return result;
			}
		}
		return null;
	}

	public void setParent(Abstract parent) {
		this.parent = parent;
	}

	public Abstract getParent() {
		return parent;
	}


	public void setAbstractType(Type abstractType) {
		this.abstractType = abstractType;
	}


	public Type getAbstractType() {
		return abstractType;
	}
	

}
