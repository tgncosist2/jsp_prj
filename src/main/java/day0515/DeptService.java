package day0515;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class DeptService {

   public List<Dept> searchAllDept(){
      List<Dept> list=null;
      
      DeptDAO dDAO=DeptDAO.getInstance();
      try {
         list=dDAO.selectAllDept();
         //list=new ArrayList<Dept>();//조회된 결과가 없음
      } catch (SQLException e) {
         e.printStackTrace();
      }//end catch
      
      return list;
   }//searchAllDept
   
   public String jsobObj() {
      String strJSON="";
      
      List<Dept> list=null;
      
      DeptDAO dDAO=DeptDAO.getInstance();
      try {
         list=dDAO.selectAllDept();//데이터 조회

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
         for(Dept deptDto : list) {
            //DB에서 검색된 데이터로 JSONObject을 생성하여 JSONArray에 할당
            jsonTemp=new JSONObject();
            jsonTemp.put("deptno", deptDto.getDeptno());
            jsonTemp.put("dname", deptDto.getDname());
            jsonTemp.put("loc", deptDto.getLoc());
            
            jsonArr.add(jsonTemp);
            //JSONArray를 JSOBObject 할당
            jsonObj.put("data", jsonArr);
            
            strJSON=jsonObj.toJSONString();
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }//end catch
      
      return strJSON;
      
   }//jsonObj
}//class
