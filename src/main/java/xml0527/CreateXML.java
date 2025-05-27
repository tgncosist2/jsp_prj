package xml0527;

import org.jdom2.Document;

public class CreateXML {
	
	public void createXML() {
		Document doc = new Document();
		
		System.out.println(doc);
	}

	public static void main(String[] args) {
		new CreateXML().createXML();
	}
}
