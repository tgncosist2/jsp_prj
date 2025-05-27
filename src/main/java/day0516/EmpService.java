package day0516;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class EmpService {
   
   public String searchEmp(int deptno) {
      String strJSON="";
      
      List<EmpDTO> list=null;
      
      EmpDAO eDAO=EmpDAO.getInstance();
      try {
         list=eDAO.selectEmp(deptno);

         SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
         //1. JSONObject 생성(데이터의 부가적인 정보, 데이터를 가질 때 사용)
         JSONObject jsonObj=new JSONObject();
         jsonObj.put("resultFlag", !list.isEmpty()); //검색 정보가 존재
         jsonObj.put("pubDate", sdf.format(new Date())); //검색 정보가 존재
         jsonObj.put("dataLength", list.size()); //검색 정보가 존재
                 
         //2. 데이터 채우기
         //JSONArray 생성(데이터를 저장)
         JSONArray jsonArr=new JSONArray();
         
         JSONObject jsonTemp=null;
         for(EmpDTO empDTO : list) {
            //DB에서 검색된 데이터로 JSONObject을 생성하여 JSONArray에 할당
            jsonTemp=new JSONObject();
            jsonTemp.put("empno", empDTO.getEmpno());
            jsonTemp.put("ename", empDTO.getEname());
            jsonTemp.put("job", empDTO.getJob());
            jsonTemp.put("mgr", empDTO.getMgr());
            // 날짜를 그대로 JSONObject에 할당하면 사용한 곳에서 error가 발생한다.
            jsonTemp.put("hiredate", sdf.format(empDTO.getHiredate()));
            jsonTemp.put("sal", empDTO.getSal());
            jsonTemp.put("comm", empDTO.getComm());
            jsonTemp.put("deptno", empDTO.getDeptno());
            
            jsonArr.add(jsonTemp);
            //JSONArray를 JSOBObject 할당
            jsonObj.put("data", jsonArr);
            
         }
         
         strJSON=jsonObj.toJSONString();
      } catch (SQLException e) {
         e.printStackTrace();
      }//end catch
      
      return strJSON;
      
   }//jsonObj
}//class
