package day0512;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class MemberService {

	public List<Member> searchAllMember() {
		List<Member> list = new ArrayList<Member>();

		if (new Random().nextBoolean()) {
			list.add(new Member(1, "강태일","test@test.co.kr","010-1234-1234"));
			list.add(new Member(2, "강태이","test123@test.co.kr","010-4444-2244"));
			list.add(new Member(3, "강태삼","acacss@test.co.kr","010-7878-6666"));
			list.add(new Member(4, "강태사","qweqwe@test.co.kr","010-7788-9874"));
		}// end if

		return list;
	}// searchAllMember

}// class
