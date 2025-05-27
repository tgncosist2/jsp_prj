package xml0527;

import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class CreateXML {

	public void createXML() throws IOException {
		// 1. XML문서 객체 생성
		Document doc = new Document(); // <?xml version="1.0" encoding="UTF-8" ?>

		// 2. 최상위 부모노드 생성
		Element rootNode = new Element("root"); // <root> </root>

		// 3. 자식 노드를 생성
		Element msgNode = new Element("msg");

		// 3-1. 자식노드에 값 설정
		msgNode.setText("안녕하세요?");

		// 4. 배치
		rootNode.addContent(msgNode);

		// 4-1. XML문서객체에 최상위 부모노드 배치
		doc.addContent(rootNode);

		// 5. 생성된 XML을 출력, 출력객체 생성!
		XMLOutputter xout = new XMLOutputter(Format.getPrettyFormat());
		
		// 콘솔창 출력
		xout.output(doc, System.out);
		
		// 파일로 출력
		xout.output(doc, new FileOutputStream("C:/dev/workspace/jsp_prj/src/main/webapp/xml0527/create.xml"));
	}// createXML

	public static void main(String[] args) {
		try {
			new CreateXML().createXML();
		} catch (IOException e) {
			e.printStackTrace();
		}// end try-catch
	}// main
}// class
