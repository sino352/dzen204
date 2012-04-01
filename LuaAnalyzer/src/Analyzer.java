import java.util.LinkedList;

public class Analyzer {
	
	private static final String KNOWN_KW = " local function end for while if "; 
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Analyzer analyzer = new Analyzer();
		analyzer.start();
		
	}
	
	private TreeEntry globalScope;
	private TreeEntry currentScope;
	private LinkedList<TreeEntry> abstr;
	private FileReader file;
	
	private boolean shouldBeName = false;
	private boolean shouldBeValue = false;
	private boolean canBeParameter = false;
	
	
	public Analyzer(){
		globalScope = createGlobalScope();
		currentScope = globalScope;
		abstr = new LinkedList<TreeEntry>();
		//abstr = new TreeEntry();
	}
	
	public void start() {
		
		/*
		Abstract a1 = new Abstract("a1");
		globalScope.addChield("a1", a1);
		
		Abstract a2 = new Abstract("a2");
		globalScope.addChield("a2", a2);
		
		Abstract a11 = new Abstract("a11");
		a1.addChield("a11", a11);
		
		Entity test = new Entity("a1fghfgjfgjfgjfjv11");
		
		Abstract a111 = test.getAbstract();
		a11.addChield("a111", a111);
		
		Abstract search = globalScope.getFromLocalAndChield("a111");
		System.out.print(search.getName());
		*/
		
		file = new FileReader("test");
		
		expect(CodeEntry.Type.KEYWORD);
		
		
		/*try {
			f.read(FileReader.ExpectedType.KEYWORD);
			f.read(FileReader.ExpectedType.KEYWORD,FileReader.ExpectedType.OPERATION);
			f.read(FileReader.ExpectedType.KEYWORD);
		}catch (Exception e){
		}*/
		
		
		
	}
	
	private void expect(CodeEntry.Type... expectedTypes){
		try{
			CodeEntry ro = file.read(expectedTypes);
			
			if (CodeEntry.Type.KEYWORD == ro.getBasicType())
				processKeyword(ro.getName());
			else if (CodeEntry.Type.OPERATION == ro.getBasicType())
				processOperation(ro.getName());
			
			
			
		} catch(Exception e) {
			
		}
	}
	
	private void processKeyword(String keyword){
		// check whether this is known Lua keyword
		if(shouldBeName){
			shouldBeName = false;
			getAbstract(false).setName(keyword);
		}
		else if(shouldBeValue){
			shouldBeValue = false;
			if (KNOWN_KW.lastIndexOf(keyword) > 0){
				
			}
				
		}
		else if (KNOWN_KW.lastIndexOf(keyword) > 0){
			processLuaKW(keyword);
		}
		expect(CodeEntry.Type.OPERATION);
	}
	
	private void processOperation(String operation){
		if (operation.equals("=")){
			shouldBeValue = true;
			expect(CodeEntry.Type.KEYWORD, CodeEntry.Type.OPERATION);
		}
		
	}
	
	private void processLuaKW(String keyword){
		if (keyword.equals("local")) {
			mekeAbstractLocal();
			shouldBeName = true;
			expect(CodeEntry.Type.KEYWORD);
		}
	}
	
	private void mekeAbstractLocal(){
		TreeEntry currentAbstract = getAbstract(false);
		currentScope.addChield(currentAbstract.getName(), currentAbstract);
	}
	
	private TreeEntry getAbstract(boolean fromBottom){
		if (abstr.size() > 0){
			return (fromBottom) ? abstr.getLast() : abstr.getFirst();
		}
		String newAbstractName = "abstract" + abstr.size();
		TreeEntry newAbstr = new TreeEntry(newAbstractName);
		abstr.addFirst(newAbstr);
		return newAbstr;
		
	}
	
	private TreeEntry createGlobalScope(){
		TreeEntry scope = new TreeEntry();
		return scope;
	}

}
