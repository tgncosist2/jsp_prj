package util;

public class MyUtil {


	/**
	 * 이 method는 <input type='radio'를 사용자 원하는 개수로 만드는 일을 한다. <br>
	 * 사용법 <br>
	 * 
	 * @param name
	 * @param radioInd
	 * @param cnt
	 * @param flagNum
	 * @return
	 */
	public static String makeRadio(String name, int radioInd, int cnt, int flagNum) {
		if (cnt > 100) {
			cnt = 100;
		} // end if

		if (cnt > flagNum && flagNum < 0) {
			flagNum = 0;
		} // end if

		StringBuilder sbTemp = new StringBuilder();

		for (int i = 0; i <= cnt; i++) {
			sbTemp.append("<input type='radio' name='").append(name).append("_").append(radioInd).append("' ")
					.append("value='").append(i).append("' ").append(i == flagNum ? "checked='checked'/>" : "/>")
					.append(i).append("\n");
		}

		return sbTemp.toString();
	}

}
