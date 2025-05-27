package day0515;

import java.io.FileWriter;
import java.io.IOException;

import javax.swing.JOptionPane;

public class CreateText {
	
	public static StringBuilder sb = new StringBuilder();
	
	public static void main(String[] args) {
		sb.append(JOptionPane.showInputDialog("입력"));
		
		try {
			FileWriter fw = new FileWriter("C:/dev/workspace/jsp_prj/src/main/webapp/day0515/ajax.txt");
			
			fw.write(sb.toString());
			fw.flush();
			fw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}// main
}// class
