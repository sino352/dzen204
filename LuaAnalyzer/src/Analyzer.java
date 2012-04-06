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
		Iteration newIter = new Iteration();
		expect(newIter, CodeEntry.Type.KEYWORD);
		
		
		/*try {
			f.read(FileReader.ExpectedType.KEYWORD);
			f.read(FileReader.ExpectedType.KEYWORD,FileReader.ExpectedType.OPERATION);
			f.read(FileReader.ExpectedType.KEYWORD);
		}catch (Exception e){
		}*/
		
		
		
	}
	
	private void expect(Iteration curIter, CodeEntry.Type... expectedTypes){
		try{
			Iteration newIter = new Iteration();
			CodeEntry ro = file.read(expectedTypes);
			
			if (CodeEntry.Type.KEYWORD == ro.getBasicType())
				processKeyword(curIter, newIter, ro.getName());
			else if (CodeEntry.Type.OPERATION == ro.getBasicType())
				processOperation(curIter, newIter, ro.getName());
			
			
			
		} catch(Exception e) {
			
		}
	}
	
	
	
	private void processKeyword(Iteration curIter, Iteration newIter, String keyword){
		// check whether this is known Lua keyword
		if(curIter.shouldBeName()){
			getAbstract(false).setName(keyword);
		}
		else if(curIter.shouldBeValue()){
			if (KNOWN_KW.lastIndexOf(keyword) > 0){
				
			}
			getAbstract(false).setName(keyword);
			//newIter.canBeComma(true); multiple assigment
			newIter. -------------------- sto here
				
		}
		else if (KNOWN_KW.lastIndexOf(keyword) > 0){
			processLuaKW(curIter, newIter, keyword);
		}
		expect(newIter, CodeEntry.Type.OPERATION);
	}
	
	private void processOperation(Iteration curIter, Iteration newIter, String operation){
		if (operation.equals("=")){
			newIter.shouldBeValue(true);
			expect(curIter, CodeEntry.Type.KEYWORD, CodeEntry.Type.OPERATION);
		}
		
	}
	
	private void processLuaKW(Iteration curIter, Iteration newIter, String keyword){
		if (keyword.equals("local")) {
			mekeAbstractLocal();
			curIter.shouldBeName(true);
			expect(newIter, CodeEntry.Type.KEYWORD);
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
