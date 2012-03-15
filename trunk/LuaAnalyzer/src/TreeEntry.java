import java.util.HashMap;



public class TreeEntry extends CodeEntry {
	
	public static enum Type {
		FUNCTION,
		VARIABLE,
		TABLE
	}
	
	private Type abstractType;
	private TreeEntry parent;
	private HashMap<String, TreeEntry> children=new HashMap<String, TreeEntry>();
	
	public TreeEntry(){
		super();
		//children = new HashMap<String, Abstract>();
	}
	
	
	public TreeEntry(String name){
		super(name);
		
	}
		
	public void addChield(String chName, TreeEntry chield){
		chield.setParent(this);
		children.put(chName, chield);
	}
	
	public TreeEntry getFromLocalAndParent(String chName){
		if (children.containsKey(chName))
			return children.get(chName);
		else if (null != parent)
			return parent.getFromLocalAndParent(chName);
		return null;
	}
	
	public TreeEntry getFromLocalAndChield(String chName){
		if (children.containsKey(chName))
			return children.get(chName);
		else {
			for(TreeEntry chield:children.values()){
				TreeEntry result = chield.getFromLocalAndChield(chName);
				if (null != result)
					return result;
			}
		}
		return null;
	}

	public void setParent(TreeEntry parent) {
		this.parent = parent;
	}

	public TreeEntry getParent() {
		return parent;
	}


	public void setAbstractType(Type abstractType) {
		this.abstractType = abstractType;
	}


	public Type getAbstractType() {
		return abstractType;
	}
	

}
