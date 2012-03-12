import java.util.HashMap;



public class Abstract {
	public static enum Type {
		FUNCTION,
		VARIABLE,
		TABLE
	}
	private String name;
	private Abstract parent;
	private boolean hasParent;
	private HashMap<String, Abstract> children;
	
	public Abstract(){
		children = new HashMap<String, Abstract>();
	}
	
	public Abstract(String name){
		this();
		this.name = name;
	}
	
	public Abstract(Abstract parent){
		this();
		this.parent = parent;
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

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setParent(Abstract parent) {
		this.hasParent = true;
		this.parent = parent;
	}

	public Abstract getParent() {
		return parent;
	}
	

}
