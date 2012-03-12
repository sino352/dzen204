public class Analyzer {
	
	private static final String KNOWN_KW = " local function end for while if "; 
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Analyzer analyzer = new Analyzer();
		analyzer.start();
		
	}
	
	private Abstract globalScope;
	private Abstract currentScope;
	private Abstract abstr;
	private FileReader file;
	
	public Analyzer(){
		globalScope = createGlobalScope();
		abstr = new Abstract();
	}
	
	public void start() {
		
		
		Abstract a1 = new Abstract("a1");
		globalScope.addChield("a1", a1);
		
		Abstract a2 = new Abstract("a2");
		globalScope.addChield("a2", a2);
		
		Abstract a11 = new Abstract("a11");
		a1.addChield("a11", a11);
		
		Abstract a111 = new Abstract("a111");
		a11.addChield("a111", a111);
		
		Abstract search = globalScope.getFromLocalAndChield("a111");
		System.out.print(search.getName());
		
		file = new FileReader("test");
		/*try {
			f.read(FileReader.ExpectedType.KEYWORD);
			f.read(FileReader.ExpectedType.KEYWORD,FileReader.ExpectedType.OPERATION);
			f.read(FileReader.ExpectedType.KEYWORD);
		}catch (Exception e){
		}*/
		
		
		
	}
	
	private void expect(FileReader.ExpectedType... expectedTypes){
		try{
			FileReader.ReadOperationResult ro = file.read(expectedTypes);
			
			if (FileReader.ExpectedType.KEYWORD == ro.type)
				processKeyword(ro.value);
			else if (FileReader.ExpectedType.OPERATION == ro.type)
				processOperation(ro.value);
			
			
			
		} catch(Exception e) {
			
		}
	}
	
	private void processKeyword(String keyword){
		// check whether this is known Lua keyword
		if (KNOWN_KW.lastIndexOf(keyword) > 0){
			
		}
	}
	
	private void processOperation(String operation){
		
	}
	
	private void processLuaKW(String keyword){
		
	}
	
	
	
	private Abstract createGlobalScope(){
		Abstract scope = new Abstract();
		return scope;
	}

}
