
public class Entity {

	public static enum Type{
		NULL,
		KEYWORD,
		OPERATION
	}
	
	protected String name;
	private int startPosition;
	private int endPosition;
	private Type entityType;
	private Abstract childAbstract;
	
	public Entity(){
		this.entityType = Type.NULL;
		this.name = "";
	}
	
	public Entity(Abstract abs){
		childAbstract = abs;
		
	}
	
	public Entity(String name){
		this();
		this.name = name;
	}
	
	public Abstract getAbstract(){
		if (null != childAbstract){
			return childAbstract;
		}
		childAbstract = new Abstract();
		childAbstract.setName(this.name);
		childAbstract.setStartPosition(this.startPosition);
		childAbstract.setEndPosition(this.endPosition);
		childAbstract.setBasicType(this.entityType);
		return childAbstract;
	}

	public void setStartPosition(int startPosition) {
		this.startPosition = startPosition;
	}

	public int getStartPosition() {
		return startPosition;
	}

	public void setEndPosition(int endPosition) {
		this.endPosition = endPosition;
	}

	public int getEndPosition() {
		return endPosition;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setBasicType(Type basicType) {
		this.entityType = basicType;
	}

	public Type getBasicType() {
		return entityType;
	}
	
}
