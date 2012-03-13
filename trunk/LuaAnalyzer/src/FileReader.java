import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FileReader {
	
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
	
	
	public Entity read(Entity.Type... expectedTypes) throws Exception {
		
		// get next word from file
		Entity word = readWord();
		
		// match expected type and "word" type
		
		for(Entity.Type et : expectedTypes){
			if (et.equals(word.getBasicType())){
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
	
	private Entity readWord(){
		boolean inWord = false;
		String currentWord = "";
		Entity.Type wordType = Entity.Type.NULL;
		
		int startPosition = inFilePosition;
		for(int i=startPosition; i<fileContent.length(); i++){
			String c = fileContent.charAt(i) + "";
			//System.out.println(c);
			if (SKIP_PATTERN.matcher(c).matches()){
				if (inWord) {
					inFilePosition = i+1;
					break;
				}
			} else if (KEYWORD_PATTERN.matcher(c).matches()) {
				inWord = true;
				wordType = Entity.Type.KEYWORD;
				currentWord += c;
			} else if (OPERATION_PATTERN.matcher(c).matches()) {
				if (inWord){
					inFilePosition = i;
					break;
				}
				wordType = Entity.Type.OPERATION;
				currentWord = c;
				inFilePosition = i+1;
				break;
			}
		}
		System.out.println("Word:"+currentWord);
		
		Entity resultObject = new Entity();
		resultObject.setStartPosition(startPosition);
		resultObject.setEndPosition(inFilePosition - 1);
		resultObject.setName(currentWord);
		resultObject.setBasicType(wordType);
		return resultObject;
	}
	
	
	
	

}
