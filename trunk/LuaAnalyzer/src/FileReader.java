import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FileReader {
	
	public static enum ExpectedType {
		NULL,
		KEYWORD,
		OPERATION
	};
	
	public class ReadOperationResult {
		public ExpectedType type;
		public String value;
		public ReadOperationResult(){
			type = ExpectedType.NULL;
			value = "";
		}
		
	}
	
	//private static final Pattern READ_PATTERN = Pattern.compile("(([,.=+-~/])|([^ ;]*))");
	private static final Pattern SKIP_PATTERN = Pattern.compile("[ ;\t]");
	private static final Pattern KEYWORD_PATTERN = Pattern.compile("[\\w]");
	private static final Pattern OPERATION_PATTERN = Pattern.compile("[,.+=-~/]");
	
	private String fileContent;
	private int inFilePosition;

	
	public FileReader(String fileName) {
		inFilePosition = 0;
		fileContent = "Con2fig = {\n" +
				" a = \"b\", c = 3\n" +
				"};\n" +
				" a = 1;\n";
		
	}
	
	
	public ReadOperationResult read(FileReader.ExpectedType... expectedTypes) throws Exception {
		
		// get next word from file
		ReadOperationResult word = readWord();
		
		// match expected type and "word" type
		
		for(FileReader.ExpectedType et : expectedTypes){
			if (et.equals(word.type)){
				return word;
			}
		}
		
		System.out.println("[ERROR] got wrong type");
		throw new Exception();
		
		/*
		Matcher m = READ_PATTERN.matcher(fileContent);
		//m.region(1, 2);
		String found;
		
		if (m.find(inFilePosition)) {
			found = fileContent.substring(m.start(), m.end());
			inFilePosition = m.end();
			System.out.print(found);
			
			switch (et) {
			case keyword:
				if (KEYWORD_PATTERN.matcher(found).matches()) {
					System.out.print("Valid");
					return found;
				}
				break;
			case operation:
				if (OPERATION_PATTERN.matcher(found).matches()) {
					System.out.print("Valid");
					return found;
				}
				break;

			default:
				System.out.print("Not recognized expect type");
				break;
			}
		}
		
		System.out.print("Invalid");
		*/
		
		
		
	}
	
	private ReadOperationResult readWord(){
		ReadOperationResult currentWord = new ReadOperationResult();
		boolean inWord = false;
		
		for(int i=inFilePosition; i<fileContent.length(); i++){
			String c = fileContent.charAt(i) + "";
			//System.out.println(c);
			if (SKIP_PATTERN.matcher(c).matches()){
				if (inWord) {
					inFilePosition = i+1;
					break;
				}
			} else if (KEYWORD_PATTERN.matcher(c).matches()) {
				inWord = true;
				currentWord.type = ExpectedType.KEYWORD;
				currentWord.value += c;
			} else if (OPERATION_PATTERN.matcher(c).matches()) {
				if (inWord){
					inFilePosition = i;
					break;
				}
				currentWord.type = ExpectedType.OPERATION;
				currentWord.value = c;
				inFilePosition = i+1;
				break;
			}
		}
		
		System.out.println("Word:"+currentWord.value);
		return currentWord;
	}
	
	
	
	

}
