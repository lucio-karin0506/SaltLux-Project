package bicyclelogic;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;


public class BicycleDAO {
   String url = "jdbc:oracle:thin:@localhost:1521/xe";
   String id = "hr";
   String pw = "hr";
   
   // 따릉이 대여소 대여 순위
   public ArrayList<BicycleVO> getRentalRank(String lental_office, String lental_hour) {
      Connection con = null;
      ArrayList<BicycleVO> bicycleList = new ArrayList<>();
      
      try {
         con = DriverManager.getConnection(url, id, pw);
         String sql = "select rental_office_name, hour, cnt\r\n" + 
         					"from (\r\n" + 
			         		"    select to_char(rental_datetime, 'HH24') hour, rental_office_name, count(*) cnt\r\n" + 
			         		"    from bicycle\r\n" + 
			         		"    where rental_office_name like '%' || ? || '%' and  to_char(rental_datetime,'HH24')=?\r\n" + 
			         		"    group by rental_office_name, to_char(rental_datetime,'HH24')\r\n" + 
			         		"    order by 3 desc\r\n" + 
			         		")\r\n" + 
			         		"where rownum <= 10";
         
         PreparedStatement pstmt = con.prepareStatement(sql);
         pstmt.setString(1,  lental_office);
         pstmt.setString(2, lental_hour);
         
         ResultSet rs = pstmt.executeQuery();
         
         while(rs.next()) {
            BicycleVO bicycleInfo = new BicycleVO();
            bicycleInfo.setLental_office(rs.getString("rental_office_name"));
            bicycleInfo.setLental_count(rs.getString("cnt"));
            
            bicycleList.add(bicycleInfo);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         if(con != null) {
            try {con.close();} catch(Exception e) {}
         }
      }

      return bicycleList;
   }
   
   //월별 대여 횟수 조회 메소드
   public ArrayList<BicycleVO> getReturnRank(String return_office, String return_hour) {
	      Connection con = null;
	      ArrayList<BicycleVO> bicycleList = new ArrayList<>();
	      
	      try {
	         con = DriverManager.getConnection(url, id, pw);
	         String sql = "select return_office_name, hour, cnt\r\n" + 
	         					"from (\r\n" + 
				         		"    select to_char(return_datetime, 'HH24') hour, return_office_name, count(*) cnt\r\n" + 
				         		"    from bicycle\r\n" + 
				         		"    where return_office_name like '%' || ? || '%' and  to_char(return_datetime,'HH24')=?\r\n" + 
				         		"    group by return_office_name, to_char(return_datetime,'HH24')\r\n" + 
				         		"    order by 3 desc\r\n" + 
				         		")\r\n" + 
				         		"where rownum <= 10";
	         
	         PreparedStatement pstmt = con.prepareStatement(sql);
	         pstmt.setString(1,  return_office);
	         pstmt.setString(2, return_hour);
	         
	         ResultSet rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            BicycleVO bicycleInfo = new BicycleVO();
	            bicycleInfo.setReturn_office(rs.getString("return_office_name"));
	            bicycleInfo.setReturn_count(rs.getString("cnt"));
	            
	            bicycleList.add(bicycleInfo);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         if(con != null) {
	            try {con.close();} catch(Exception e) {}
	         }
	      }

	      return bicycleList;
	   }
   
   // 2019 vs 2020 코로나 비교 결과get
   public ArrayList<BicycleYearCountVO> compareYearCount(){
	   Connection con = null;
	   ArrayList<BicycleYearCountVO> bicycleYearCountList = new ArrayList<>();
	   
	   try {
	         con = DriverManager.getConnection(url, id, pw);
	         String sql = "select a.month as \"월\", b.cnt2019 as \"2019년도\", a.cnt2020 as \"2020년도\", round(((a.cnt2020-b.cnt2019)/b.cnt2019)*100,2) as \"증감률\"\r\n" + 
	         		"from (select to_char(rental_datetime, 'MM') month, count(*) cnt2020\r\n" + 
	         		"        from bicycle\r\n" + 
	         		"        group by to_char(rental_datetime, 'MM')) a,\r\n" + 
	         		"       (select to_char(rental_datetime, 'MM') month, sum(rental_sum) cnt2019\r\n" + 
	         		"        from bicycle2\r\n" + 
	         		"        group by to_char(rental_datetime, 'MM')) b\r\n" + 
	         		"where a.month = b.month\r\n" + 
	         		"order by a.month";
	         
	         PreparedStatement pstmt = con.prepareStatement(sql);
	         ResultSet rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	        	 
	            BicycleYearCountVO yearCountList = new BicycleYearCountVO();
	            yearCountList.setMonth(rs.getString("월"));
	            yearCountList.setMonth_2019(rs.getString("2019년도"));
	            yearCountList.setMonth_2020(rs.getString("2020년도"));
	            yearCountList.setIncreasing_pct(rs.getDouble("증감률"));
	            
	            bicycleYearCountList.add(yearCountList);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         if(con != null) {
	            try {con.close();} catch(Exception e) {}
	         }
	      }
	   
	   return bicycleYearCountList;
   }
   
   // 2019 vs 2020 총계 도출
   public HashMap<String, String> sumYearCount(ArrayList<BicycleYearCountVO> bicycleYearCountList) {
	   HashMap<String, String> countedMap = new HashMap<>();
	   //2019년도 대여 횟수 총합
	   int sum2019=0;
	   //2020년도 대여 횟수 총합
	   int sum2020=0;
	   //대여 증감률 총계
	   double sum_pct = 0;
	   
	   for(BicycleYearCountVO bi : bicycleYearCountList) {
		   sum2019 += Integer.parseInt(bi.getMonth_2019());
		   sum2020 += Integer.parseInt(bi.getMonth_2020());
		}

	   sum_pct = ((sum2020 - sum2019) / (double)sum2019) * 100;
	   
	   countedMap.put("sum2019", Integer.toString(sum2019));
	   countedMap.put("sum2020", Integer.toString(sum2020));
	   countedMap.put("sum_pct", String.format("%.2f", sum_pct));
	   
	   return countedMap;
   }
   
   public ArrayList<RepairVO> getRepairList() {
		Connection con= null;
		ArrayList<RepairVO> repairList= new ArrayList<>();
		try {
			con=DriverManager.getConnection(url, id, pw);
			String sql = "select to_char(repair_datetime, 'MM') as month,"
					+ " repair_type, count(*) as repair_cnt" + 
					" from repair" + 
					" group by to_char(repair_datetime, 'MM'), repair_type" + 
					" order by 1,2";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				RepairVO repair=new RepairVO();
				repair.setMonth(rs.getInt("month"));
				repair.setRepairType(rs.getString("repair_type"));
				repair.setRepairCnt(rs.getInt("repair_cnt"));
				repairList.add(repair);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(con!=null) try {con.close();} catch(Exception e) {}
		}
		return repairList;
	}
	
	public ArrayList<RepairVO> getRepairPctList() {
		Connection con= null;
		ArrayList<RepairVO> repairList= new ArrayList<>();
		try {
			con=DriverManager.getConnection(url, id, pw);
			String sql = " select month, repair_cnt, " + 
					" case when pre_month = 0 then 0 " + 
					"    when pre_month <> 0 then round(repair_cnt/pre_month, 2) end as repair_pct" + 
					" from(" + 
					"    select month, repair_cnt," + 
					"    lag(repair_cnt, 1, 0) over (order by month) as pre_month" + 
					"    from ( select distinct to_char(repair_datetime, 'MM') as month, count(*) as repair_cnt" + 
					"           from repair " + 
					"           group by to_char(repair_datetime, 'MM') " + 
					"           order by 1 )" + 
					" )";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				
				RepairVO repair=new RepairVO();
				repair.setMonth(rs.getInt("month"));
				repair.setRepairCnt(rs.getInt("repair_cnt"));
				repair.setRepairPct(rs.getDouble("repair_pct"));
				repairList.add(repair);
				
			}System.out.println("sql에서 가져오기 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(con!=null) try {con.close();} catch(Exception e) {}
		}
		return repairList;
	}
	
	public ArrayList<LocationVO> getRentalLocation(String gu) {
		Connection con=null;
		ArrayList<LocationVO> locationList = new ArrayList<>();
		
		try {
			con=DriverManager.getConnection(url, id, pw);
			String sql="select rental_no, rental_office_name, sum(rental_count) as rental_count_total" + 
					"  from(" + 
					"    select l.rental_no as rental_no, l.rental_office_name as rental_office_name, " + 
					"        count(distinct b.rental_datetime) as rental_count" + 
					"    from bicycle b" + 
					"    join bicyclelocation l on b.rental_office_no = l.rental_no" + 
					"	 where l.rental_location = ?  " +
					"    group by l.rental_no, l.rental_office_name, to_char(b.rental_datetime, 'MM')" + 
					" )" + 
					" group by rental_no, rental_office_name" + 
					" order by rental_no";
			
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, gu);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				LocationVO location = new LocationVO();
				location.setRentalNo(rs.getInt("rental_no"));
				location.setRentalOfficeName(rs.getString("rental_office_name"));
				location.setRentalTotalCnt(rs.getInt("rental_count_total"));
				
				locationList.add(location);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(con!=null) try {con.close();} catch(Exception e) {}	
		}
		return locationList;
	}
}