package day0508;

public class DataDTO {
	private String name;
	private int myAge;
	
	public DataDTO() {
		System.out.println("DataDTO 기본 생성자");
	}
	
	public DataDTO(String name, int myAge) {
		this.name = name;
		this.myAge = myAge;
		System.out.println("DataDTO 매개변수 있는 생성자");
	}//useBean 사용 안함

	public String getName() {
		System.out.println("getName 호출");
		return name;
	}

	public void setName(String name) {
		System.out.println("setName 호출");
		this.name = name;
	}

	public int getMyAge() {
		return myAge;
	}

	public void setMyAge(int myAge) {
		this.myAge = myAge;
	}

	@Override
	public String toString() {
		return "DataDTO [name=" + name + ", myAge=" + myAge + "]";
	}

}//class
