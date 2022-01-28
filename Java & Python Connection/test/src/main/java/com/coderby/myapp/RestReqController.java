package com.coderby.myapp;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RestReqController {
	@RequestMapping("/test_req")
	public String testRequest(Model model) {
		try {
			// 브라우저 만들어 요청
			URL url = new URL("http://127.0.0.1:5000/test1?data=Hello");
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			
			InputStream in = con.getInputStream();
			InputStreamReader reader = new InputStreamReader(in, "UTF-8");
			BufferedReader response = new BufferedReader(reader);
			
			String str = null;
			StringBuffer buff = new StringBuffer();
			while ((str = response.readLine()) != null) {
				buff.append(str + "\n");
			}
			String data = buff.toString().trim();
			System.out.println("reqResult : " + data);
			model.addAttribute("reqResult", data);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "result1";
	}
}
