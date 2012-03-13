
public class Entity {

	public static enum Type{
		NULL,
		KEYWORD,
		OPERATION
	}
	
	private String name;
	private int startPosition;
	private int endPosition;
	private Type entityType;
	
	public Entity(){
		this.entityType = Type.NULL;
		this.name = "";
	}
	
	public Entity(String name){
		this();
		this.name = name;
	}
	
	public Abstract getAbstract(){
		Abstract a = new Abstract();
		a.setName(this.name);
		a.setStartPosition(this.startPosition);
		a.setEndPosition(this.endPosition);
		a.setBasicType(this.entityType);
		return a;
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
